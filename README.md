# SocialApp

A modern Flutter social media app UI clone featuring stories, posts, chat, onboarding, authentication, and animated navigation.

## Features

- Onboarding screen with gradient background
- Login and signup screens
- Instagram-like stories widget
- Reusable post widget
- Animated curved navigation bar
- Chat list and chat detail screens
- SVG asset support
- Custom gradients and styles

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (3.x recommended)
- Dart SDK

### Installation

1. **Clone the repository:**
   ```
   git clone https://github.com/yourusername/socialApp.git
   cd socialApp/social
   ```

2. **Install dependencies:**
   ```
   flutter pub get
   ```

3. **Run the app:**
   ```
   flutter run
   ```

### Assets

- Place your images and SVGs in the `assets/images/` directory.
- Declare assets in `pubspec.yaml`:
  ```yaml
  flutter:
    assets:
      - assets/images/
  ```

## Project Structure

```
lib/
  app/
    chatter.dart
    routing/
      routes.dart
      routing.dart
  presentation/
    auth/
      login/
      signup/
    onboarding/
    splash/
    home/
      home_view.dart
      widgets/
        stories.dart
        posts_widget.dart
        chatList.dart
        ...
```

## Packages Used

- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [curved_navigation_bar](https://pub.dev/packages/curved_navigation_bar)

## Customization

- Update assets in `assets/images/`
- Modify gradients and styles in `app/styles/`
- Add new screens or widgets as needed

##
