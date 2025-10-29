# 🌿 Prakruti Health App

## 🩺 Description

**Prakruti Health** is a comprehensive **Flutter-based mobile application** designed to help users discover their Ayurvedic **Prakruti** (body constitution) and receive personalized health guidance.  

Based on the ancient principles of **Ayurveda**, the app categorizes users into one of the three primary doshas: **Vata**, **Pitta**, or **Kapha**.

The app provides a **complete wellness ecosystem**, starting from user authentication to daily health tracking.

---

## ✨ Key Features

### 🧩 1. **Authentication**
- Secure login and sign-up screens.
- New users are guided through a one-time questionnaire.
- Returning users are directed straight to their personalized dashboard.

### 📜 2. **Prakruti Questionnaire**
- A **15-question survey** that analyzes the user's physical, mental, and emotional traits.
- Determines the user's dominant **Prakruti (dosha)**.

### 📊 3. **Personalized Dashboard**
- Displays the user's **Prakruti** results in a visually appealing format.
- Includes a **pie chart** showcasing the balance of doshas (**Vata**, **Pitta**, **Kapha**).
- Offers a detailed description of the user's body constitution.

### 🥗 4. **Diet Plan**
- A dedicated **Diet** tab that provides personalized, **pure-vegetarian** food recommendations.
- Clear lists of foods to **favor** and foods to **reduce** based on the user's dosha.

### 🧘 5. **Yoga & Exercise Tracker**
- The **Exercise** tab features tailored **yoga asanas** and physical activities.
- Includes a **daily to-do list** for users to check off completed activities.

### 💾 6. **Local Storage**
- Utilizes **sqflite** for local database management.
- Stores user data, questionnaire results, and daily exercise logs.

### ⚙️ 7. **State Management**
- Built with **Provider** for efficient and scalable state management across the app.

---

## 🖼️ Screenshots

For a visual walkthrough of the application, check out the screenshots available in the [`/output`](./output) folder of this project.

---

## 🧭 Installation

To set up the app locally, follow the instructions below.

### 1. Clone the Repository
```bash
git clone https://github.com/hekdk/IHWP.git
```

### 2. Navigate to Project Directory
```bash
cd IHWP
```

### 3. Install Dependencies

- Run the following command in your terminal to fetch all necessary packages listed in the pubspec.yaml file:
```bash
flutter pub get
```
---

## ▶️ How to Run the Project

- This application is designed exclusively for **mobile platforms** (Android and iOS).
- It will **not function correctly as a web app**.

- You can run the app on either a **physical device** or a **virtual emulator**.

### 📱 1. Using a Physical Device (Recommended)
Steps:

- Enable **Developer Mode** on your Android or iOS device.

- Enable **USB Debugging** (on Android) within the Developer Options menu.

- Connect your device to your computer via **USB**.

- When prompted on your device, click **Allow USB Debugging**.

- In **VS Code**, select your device from the bottom-right corner (where it may show “No Device”).

- Press **F5** or go to **Run > Start Debugging** in VS Code.

### 💻 2. Using a Virtual Emulator 

Android Setup:

- Open Android Studio.

- Go to Tools > AVD Manager and create a new virtual device.

IOS Setup (macOS only):

- Open Xcode.

- Go to Window > Devices and Simulators and create a new simulator.

- Run the Emulator

- Launch the emulator you created.

- In VS Code, the emulator should appear in the device list automatically.

- Press F5 or go to Run > Start Debugging to launch the app.
