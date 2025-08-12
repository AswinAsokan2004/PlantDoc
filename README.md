# 🌿 PlantDoc – AI-Powered Plant Disease Detection

PlantDoc is an **AI-driven mobile application** that identifies plant diseases using **deep learning** and **ensemble learning** techniques.
It empowers farmers, gardeners, and plant enthusiasts to detect plant health issues quickly, reducing crop loss and promoting sustainable farming practices.

---

## 📌 Features

* **Capture or Upload** – Take a photo of the affected plant or select multiple images from your gallery.
* **Ensemble Prediction Method** – Uses a CNN-based model to process multiple images individually and combines results for improved accuracy.
* **Instant Insights** – Displays the disease name, description, and possible solutions.
* **Multi-Image Support** – Processes multiple images at once for a refined diagnosis.

---

## 🛠️ Tech Stack

### **Frontend**

* **Framework:** Flutter
* **Entry Point:** `Frontend/lib/main.dart`

### **Backend**

* **Language:** Python
* **Framework:** Flask (or relevant framework used)
* **AI Model:** CNN-based deep learning with ensemble learning
* **Entry Point:** `Backend/main.py`

### **Database**

* **MongoDB** – For storing disease data, user queries, and predictions.

---

## 🚀 How It Works

1. **Image Input** – User captures or uploads images of a plant's leaf.
2. **Image Processing** – Backend model analyzes images individually using a CNN.
3. **Ensemble Learning** – Predictions from multiple images are combined for the most accurate result.
4. **Output** – Disease name, description, and suggested remedies are displayed on the app.

---

## 📂 Project Structure

```
PlantDoc/
│
├── Frontend/               # Flutter frontend
│   └── lib/
│       └── main.dart        # Entry point for the mobile app
│
├── Backend/                 # Python backend
│   ├── main.py              # Entry point for backend server
│   ├── model/               # Trained CNN model files
│   └── utils/               # Helper functions for predictions
│
└── README.md
```

---

## ⚙️ Installation & Setup

### **Frontend Setup**

```bash
cd Frontend
flutter pub get
flutter run
```

### **Backend Setup**

```bash
cd Backend
pip install -r requirements.txt
python main.py
```

---

## 📡 API Endpoints

* **POST** `/predict` – Send one or multiple plant images for disease prediction.
* **GET** `/disease-info/<disease_name>` – Get details and remedies for a specific disease.

---

## 📈 Future Enhancements

* Support for more plant species.
* Offline mode for disease detection.
* Integration with weather and crop advisory services.

---

## 📜 License

This project is licensed under the **MIT License** – feel free to use and modify with attribution.

---

## 👨‍💻 Author

**Aswin Asokan** – Passionate about AI in Agriculture.
