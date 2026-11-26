# Hunters Group Native Flutter App

Cross-platform, native Flutter application for Hunters Group, based on the public company website: <https://huntersgroup.agency/>.

The app is built with Flutter widgets and Dart navigation for Android and iOS. It does **not** embed the website and does not use a WebView.

## Project overview

The app brings the company's public information, service listings, leadership, events, brands, and contact actions into a connected mobile experience. Original publicly available Hunters Group images are stored locally in the project.

## Features

- Branded home screen with company overview, service directory, registrations, benefits and business process.
- About screen with company mission, vision, values, leadership profiles and team photos.
- Six service categories: E-Commerce Solutions, Import, Export, Logistics & Shipping, Buyer & Sourcing Support, and Web Development.
- Dedicated e-commerce detail screens for Amazon, eBay, Etsy, Shopify, Walmart and TikTok Shop.
- Results and achievements gallery with an image viewer.
- Events page with event descriptions and photo galleries.
- Brands page for Hunters Group and Shifa Organic.
- Contact form with required-field validation that prepares an inquiry in WhatsApp; the user reviews and sends it there.
- Native external actions for WhatsApp, phone, Instagram and Facebook.
- Bottom navigation, a full navigation menu, contextual internal links, and native back navigation.
- Responsive layouts, branded Android/iOS launcher icons, and original company imagery.

## Technologies

- Flutter 3.38.6 / Dart 3.10.7 (the implementation environment).
- Material 3 Flutter widgets and Navigator named routes.
- `url_launcher` for WhatsApp, phone and social links.
- `flutter_launcher_icons` for generated Android and iOS launcher assets.
- Android Gradle/Kotlin project and generated iOS Xcode project.

Flutter and Dart versions, Android SDK, and Xcode versions on another machine may differ.

## Project structure

```text
.
├── android/                     Android application and Gradle configuration
├── assets/images/               Original company logo, service, team, event and brand images
├── ios/                         iOS Runner, Xcode project and launcher assets
├── lib/
│   ├── main.dart                App theme, app entry point and route table
│   ├── site_content.dart        Website-derived services, content and asset references
│   ├── site_pages.dart          Native screens and contact interactions
│   └── site_widgets.dart        Shared responsive UI, navigation and external-link helpers
├── test/
│   └── widget_test.dart         Navigation, contact validation and compact-layout coverage
├── pubspec.yaml                 Flutter dependencies, app assets and launcher icon settings
├── pubspec.lock                 Resolved Dart package versions
└── README.md
```

## Requirements and setup

Install Flutter with the stable channel, then configure the Android SDK and accept its licenses for Android development. iOS builds require macOS and Xcode.

From the project directory:

```powershell
flutter pub get
flutter devices
flutter run
```

For Android, connect an Android device with USB debugging enabled or start an Android emulator. For iOS, open the project on macOS with Xcode and use an iOS simulator or development-signed device.

## Analyze and test

```powershell
flutter analyze
flutter test
```

The widget suite exercises navigation from Home through service and marketplace details, contact-form validation, secondary pages, back navigation, and every implemented route at a compact phone width.

## Build the Android APK

```powershell
flutter build apk --release
```

Output path:

```text
build\app\outputs\flutter-apk\app-release.apk
```

The APK produced during project verification was approximately 74.3 MB (78,000,085 bytes) and its package metadata and supported ABIs were inspected with Android SDK `aapt`. Release configuration currently uses Flutter's template debug signing key. Configure a private release keystore for distribution; never commit signing keys or passwords. No physical-device installation test has been performed.

## Screenshots

No application screenshots are included in this repository yet.
