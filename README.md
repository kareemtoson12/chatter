# chatter

A cross-platform chat application built with Flutter.

## Features

- Runs on Android, iOS, Windows, macOS, and Linux
- Uses Material Design icons
- Path provider support for all platforms

## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart SDK (included with Flutter)
- Platform-specific dependencies (Android Studio, Xcode, etc.)

### Installation

1. Clone the repository:

   ```sh
   git clone <your-repo-url>
   cd chatter
   ```

2. Get dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:
   ```sh
   flutter run
   ```

### Building for Desktop

- **Windows:**
  ```sh
  flutter run -d windows
  ```
- **macOS:**
  ```sh
  flutter run -d macos
  ```
- **Linux:**
  ```sh
  flutter run -d linux
  ```

## Project Structure

- `lib/` - Main Dart source code
- `android/`, `ios/`, `windows/`, `macos/`, `linux/` - Platform-specific code
- `test/` - Unit and widget tests

## Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)

## License

This project is licensed under the MIT License.
