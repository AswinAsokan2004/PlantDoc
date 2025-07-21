# Import necessary modules
from flask import Flask, request, jsonify
import os
import cv2
import numpy as np
from collections import Counter
import tensorflow as tf
from pymongo import MongoClient
import sys

# Ensure stdout supports UTF-8 encoding (for special characters)
sys.stdout.reconfigure(encoding='utf-8')

# ---------------------------------------------
# DATABASE CONFIGURATION
# ---------------------------------------------
# Connect to local MongoDB server and access the "plantdoc" database
client = MongoClient("mongodb://localhost:27017/")
db = client["plantdoc"]
collection = db["plants_details"]

# ---------------------------------------------
# FLASK APP INITIALIZATION
# ---------------------------------------------
app = Flask(__name__)

# Directory where uploaded images will be saved
UPLOAD_FOLDER = 'uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# ---------------------------------------------
# LOAD TENSORFLOW MODEL
# ---------------------------------------------
# Path to the pre-trained plant disease classification model
model_path = 'plant_disease_prediction_model.h5'

# Load the model
model = tf.keras.models.load_model(model_path)
print("Model loaded successfully.")

# Compile the model (optional if not training further)
model.compile(optimizer='adam', loss='categorical_crossentropy', metrics=['accuracy'])

# ---------------------------------------------
# IMAGE PREDICTION FUNCTION
# ---------------------------------------------
def getPrediction(path):
    """
    Loads an image from the given path, preprocesses it to match the input format of the model,
    and returns the predicted class index.
    """
    img = cv2.imread(path)
    if img is None:
        print(f"Error: Image at {path} not found.")
        exit()

    # Convert BGR to RGB (as expected by TensorFlow)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

    # Resize the image to the input size of the model
    img = cv2.resize(img, (224, 224))

    # Optional: display the image (only for debugging)
    cv2.imshow("Image", img)

    # Normalize and reshape the image
    img_array = np.array(img).astype('float32') / 255.
    img_array = np.expand_dims(img_array, axis=0)

    # Make prediction
    predictions = model.predict(img_array)
    predicted_class_index = np.argmax(predictions, axis=1)
    print(f"Predicted Class Index: {predicted_class_index}")
    return predicted_class_index

# ---------------------------------------------
# ROUTE: /upload-image [POST]
# ---------------------------------------------
@app.route('/upload-image', methods=['POST'])
def upload_image():
    """
    Handles POST requests with up to 5 image files.
    Predicts the class of each image, finds the most common prediction,
    and returns associated plant name and description from MongoDB.
    """
    data_prediction_list = []

    # Handle image1 to image5
    for i in range(1, 6):
        image_key = f'image{i}'
        if image_key not in request.files:
            return jsonify({"error": f"No image file in request for {image_key}"}), 400
        
        image = request.files[image_key]
        if image.filename == '':
            return jsonify({"error": f"No selected image for {image_key}"}), 400

        # Save uploaded image
        save_path = os.path.join(app.config['UPLOAD_FOLDER'], image.filename)
        image.save(save_path)

        # Predict and store result
        data_prediction_list.append(int(getPrediction(save_path)[0]))

    print('Prediction List:', data_prediction_list)

    # Find the most frequent predicted class among all 5 images
    counter = Counter(data_prediction_list)
    most_frequent = counter.most_common(1)[0][0]
    print("Most Frequent Prediction:", most_frequent)

    # Retrieve plant details from MongoDB using the predicted index
    document = collection.find_one({"_id": most_frequent})

    # Prepare and return the JSON response
    if document:
        name = document['name']
        description = document['description'].replace("\n", "\n")
        print(name, '\n', description)

    return jsonify({
        "message": "Image uploaded successfully",
        "file_path": save_path,
        "prediction_result": most_frequent,
        "name": str(name),
        "description": str(description)
    }), 200

# ---------------------------------------------
# RUN THE FLASK APP
# ---------------------------------------------
if __name__ == '__main__':
    # Run the app in debug mode
    app.run(debug=True)
