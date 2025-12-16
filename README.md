# ace_plus_code_test

A new Flutter project.

## Getting Started

# User List App

A Flutter app that displays a list of users fetched from an API with detailed user profiles.  
The app supports **three flavors**: `dev`, `staging`, and `prod`, each with its own configuration and API base URL.

---

## Features & Packages Used

- **Multiple Flavors:** Separate configurations for `dev`, `staging`, and `prod`.
- **State Management:** Using [`flutter_riverpod` ^3.0.3](https://pub.dev/packages/flutter_riverpod).
- **Theme Persistence:** Using [`shared_preferences` ^2.5.4](https://pub.dev/packages/shared_preferences) to save and restore theme state across app restarts.
- **API Calls:** Using [`http` ^1.6.0](https://pub.dev/packages/http) package.
- **Website Links:** Using [`url_launcher` ^6.3.2](https://pub.dev/packages/url_launcher) to open user websites externally.
- **Loading Animation:** Using [`lottie` ^3.3.2](https://pub.dev/packages/lottie) for smooth loading animations.
- **Responsive UI:** Using [`flutter_screenutil` ^5.9.3](https://pub.dev/packages/flutter_screenutil) for adapting layouts and fonts across different screen sizes.

---

## How to Run the App

Run the app on a connected device or emulator by specifying the flavor and entry point:

```bash
flutter run --flavor dev -t lib/main_dev.dart
flutter run --flavor staging -t lib/main_staging.dart
flutter run --flavor prod -t lib/main_prod.dart
