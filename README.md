# Basalt Assessment | Market Stack Report

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Basalt Assessment works on iOS and Android, but was tested on Android._

---

## Generating Model Serializers

```sh
$ flutter pub run build_runner watch --delete-conflicting-outputs
```

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage
```

---

## Building Project

To build the application use the following command:

```sh
# Android Split Packages
$ flutter build apk --flavor production --target lib/main_production.dart --split-per-abi

# Android Bundle
$ flutter build appbundle --flavor production --target lib/main_production.dart

# iOS
$ flutter build ios --flavor production --target lib/main_production.dart
```

---

## Screenshots

## ![Screen 1](https://res.cloudinary.com/iamngoni/image/upload/v1667304175/Screenshot_1667301990_xo6wbz.png)

![Screen](https://res.cloudinary.com/iamngoni/image/upload/v1667304188/Screenshot_1667301984_z5errp.png)

---

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
