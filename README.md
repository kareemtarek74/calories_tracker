# Calories Tracker App

## 📌 Overview
A simple meal tracking app that allows users to add, view, sort, and delete meals. The app keeps track of total daily calories and stores data locally.

## 🔧 Tech Stack
- **Framework:** Flutter
- **State Management:** Flutter Bloc
- **Local Storage:** Hive
- **Language:** Dart

## 📜 Features
- Add a meal (name, calories, time, photo)
- Display meals in a list with total calories per day
- Sort meals by name, calories, or time
- Delete a meal entry
- Persist data locally using Hive

## 🛠 Installation & Running the App

### Prerequisites
- Install Flutter: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)
- Ensure you have an emulator or a connected physical device

### Steps
1. Clone the repository:
   ```sh
   git clone https://github.com/kareemtarek74/calories_tracker
   cd meal_tracker_app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## 📱 APK Download
You can download and install the APK from the following link:
https://drive.google.com/file/d/1sVqbCcoqhP9WeThGGUmfBYGAO0oV6D0a/view?usp=sharing

## 📏 Responsiveness Approach
- Utilized `MediaQuery` and `Flexible` widgets for adaptive layouts
- Used `ListView.builder` for scalable UI components
- Tested across different screen sizes and orientations

## 📂 Project Structure
```
meal_tracker_app/
│── lib/
│   │── Features/
│   │   ├── Data/ (Local storage models)
│   │   ├── Domain/ (Entities & use cases)
│   │   ├── Presentation/ (UI & Cubits)
│   │── core/ (Shared utilities & styles)
│   ├── main.dart
│── test/ (Unit & widget tests)
│── pubspec.yaml (Dependencies)
│── README.md
```

## 📌 Notes
- The app is built with clean architecture to separate concerns
- Uses `flutter_bloc` for state management
- Stores meals locally using Hive for fast retrieval

---
### 📧 Contact
If you have any questions, feel free to reach out!

📩 Email: Kareemtarek015@gmail.com

