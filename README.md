# Flutter Ecom App

A basic ecommerce app I made while learning Flutter. It shows a home screen with featured products and a product list. You can add items to cart and like products.

This is part of my Flutter course project.

---

## Features

- Home screen with featured products (horizontal scroll)
- Product list with category filter
- Like / unlike products
- Add to cart with live badge count
- Product detail bottom sheet
- Bottom navigation bar

---

## Project Structure

```
lib/
├── main.dart          # App entry point
└── my_home_page.dart  # Main home screen
```

---

## How to Run

Make sure you have Flutter installed. If not, download it from [flutter.dev](https://flutter.dev).

Check if Flutter is set up correctly:
```bash
flutter doctor
```

Get dependencies:
```bash
flutter pub get
```

Run the app:
```bash
flutter run
```

Run on a specific device (if you have multiple connected):
```bash
flutter devices          # lists all available devices
flutter run -d chrome    # run on Chrome
flutter run -d android   # run on Android emulator
```

Build APK (for Android):
```bash
flutter build apk
```

---

## Requirements

- Flutter SDK (3.0 or above)
- Dart SDK
- Android Studio or VS Code
- Android emulator or a real device

---

## Dependencies

No extra packages used. Only the default Flutter packages that come with a new project.

```yaml
dependencies:
  flutter:
    sdk: flutter
```

---

## Screens

| Home Screen | Product Detail |
|-------------|----------------|
| Featured cards, category chips, product list | Bottom sheet with add to cart |

---

## Notes

- Prices are in Indian Rupees (Rs.)
- No backend connected, all data is hardcoded
- Made this as part of a Flutter course

---

## Author

Harshit