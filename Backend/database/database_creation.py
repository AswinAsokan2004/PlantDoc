import pandas as pd
from pymongo import MongoClient

# Connect to MongoDB (modify the connection string if using MongoDB Atlas)
client = MongoClient("mongodb://localhost:27017/")

# Create (or access) the 'plantdoc' database
db = client["plantdoc"]

# Create (or access) the 'plants_collection' collection
collection = db["plants_details"]

# Read the CSV file with a different encoding to avoid UnicodeDecodeError
csv_file = "plant_csv.csv"  # Change this to your CSV file path

try:
    df = pd.read_csv(csv_file, encoding="ISO-8859-1")  # Try alternative encoding
except UnicodeDecodeError:
    df = pd.read_csv(csv_file, encoding="latin1")  # Fallback to another encoding

# Ensure the CSV has 'name' and 'description' columns (lowercase issue fixed)
if "name" not in df.columns or "description" not in df.columns:
    print("Error: CSV must have 'name' and 'description' columns")
    exit()

# Convert DataFrame to a list of dictionaries with ID starting from 0
plants_data = [
    {"_id": idx, "name": row["name"], "description": row["description"]}
    for idx, row in df.iterrows()
]
collection.delete_many({})
for idx, row in df.iterrows():
    data = {"_id": idx, "name": row["name"], "description": row["description"]}
    collection.insert_one(data)
    print(data)
print(len(df))  # Print the total number of rows
#collection.delete_many({})  # ❗ Clears all documents in collection
#collection.insert_many(plants_data)  # Insert fresh data
print(f"Inserted {len(plants_data)} records into MongoDB.")

# # Insert into MongoDB
# collection.insert_many(plants_data)
# #print(plants_data)

# print("Data successfully inserted into MongoDB.")
