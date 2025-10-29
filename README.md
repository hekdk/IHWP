Prakruti Health App

Description

Prakruti Health is a comprehensive Flutter-based mobile application designed to help users discover their Ayurvedic Prakruti (body constitution) and receive personalized health guidance. Based on the principles of Ayurveda, the app categorizes users into one of the three primary doshas: Vata, Pitta, or Kapha.

The app provides a complete wellness ecosystem, starting from user authentication to daily health tracking.

Key Features

Authentication: Secure Login and Sign Up screens. New users are guided to the questionnaire, while returning users are taken directly to their dashboard.

Prakruti Questionnaire: A one-time, 15-question survey that analyzes the user's physical, mental, and emotional characteristics to determine their dominant Prakruti.

Personalized Dashboard: A dynamic home screen that displays the user's Prakruti results, including a beautiful pie chart showing the balance of their doshas (Vata, Pitta, Kapha) and a detailed description of their constitution.

Diet Plan: A dedicated "Diet" tab that provides personalized, pure-vegetarian food recommendations. It clearly lists foods to favor and foods to reduce based on the user's dosha.

Yoga & Exercise Tracker: An "Exercise" tab with a list of recommended yoga asanas and physical activities tailored to the user's Prakruti. It features a daily to-do list, allowing users to check off activities as they complete them.

Local Storage: Utilizes sqflite for robust, on-device database management, storing user data, questionnaire results, and daily exercise logs.

State Management: Built with provider for efficient and scalable state management across the application.

Screenshots

For a visual walkthrough of the application, please refer to the screenshots available in the /output folder of this project.

Installation

To get a local copy up and running, follow these simple steps.

Clone the Repository:

git clone https://github.com/hekdk/IHWP.git


Navigate to Project Directory:

cd ihwp


Install Dependencies:
Run the following command in your terminal to fetch all the necessary packages listed in pubspec.yaml:

flutter pub get


How to Run the Project

This application is designed exclusively for mobile platforms (Android and iOS) and will not function correctly as a website.

You can run the app using either a physical device or a virtual emulator.

1. Using a Physical Device (Recommended)

Enable Developer Mode: On your Android or iOS device, enable Developer Options.

Enable USB Debugging: On Android, find and enable "USB Debugging" within Developer Options.

Connect Your Device: Plug your device into your computer via USB. A prompt may appear on your device to "Allow USB Debugging." Accept it.

Select Device in VS Code: In the bottom-right corner of VS Code, click on the device name (it might say "No Device") and select your connected phone.

Run the App: Press F5 or use the Run > Start Debugging menu in VS Code.

2. Using a Virtual Emulator

Set Up an Emulator:

For Android: Open Android Studio, go to Tools > AVD Manager, and create a new virtual device.

For iOS: (macOS only) Open Xcode, go to Window > Devices and Simulators, and create a new simulator.

Launch the Emulator: Start the virtual device you created.

Select Emulator in VS Code: The running emulator should automatically appear in VS Code's device list.

Run the App: Press F5 or use the Run > Start Debugging menu in VS Code.