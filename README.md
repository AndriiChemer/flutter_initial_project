# Basic project config

A Flutter project designed to showcase various libraries and tools that enhance Flutter app development.

## Routing
Library [auto_route](https://pub.dev/packages/auto_route).

To generate the necessary routing code for your Flutter app, run the following command:

```bash
fvm flutter packages pub run build_runner build
```

## Translations

Library [easy_localization](https://pub.dev/packages/easy_localization).

For localization support, generate localization keys with:

```bash
flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart

```
## Tests

### Golden Tests
Library [golden_toolkit](https://pub.dev/documentation/golden_toolkit/latest/).

To run all golden tests and update the golden files, use the following command:
  ```bash
  flutter test --update-goldens --tags=golden
  ```

### Integration Testing
#### Documentation

- [Official Flutter Documentation on Integration Tests](https://docs.flutter.dev/testing/integration-tests)
- [Flutter Repository: Integration Testing for Android](https://github.com/flutter/flutter/tree/main/packages/integration_test#android-device-testing)

#### Command Examples

- To run an integration test:
  ```bash
  flutter test integration_test/test_app.dart
  ```
- To run a test for a specific page:

```bash
  flutter test integration_test/page/user_form/user_form_page_test.dart
```

## Build Code Generation for Selected Elements
You can build code generation for specific elements using filters. Here are a few examples:

- Build the navigation code:
  ```bash
  flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/navigation/*.dart'

  ```
- Build all pages within a specific folder:

    ```bash
      flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/page/{page}/*.dart'
    
    ```
    
#### Example Commands
Here are specific commands to build code for certain directories:
- For the main page:
  ```bash
  flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/page/main/*.dart'
  ```
- For car data transfer objects:

    ```bash
      flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/data/cars/dto/*.dart'
    ```
- To build all generated code:

    ```bash
      flutter pub run build_runner build --delete-conflicting-outputs
    
    ```
#### Troubleshooting build_runner Issues
If you encounter issues with build_runner, such as method not found errors, refer to this guide [Troubleshooting build_runner](https://docs.flutter.dev/testing/integration-tests).

To resolve build issues, try running the following commands:

```bash
  flutter clean
  flutter packages pub get
```
## Other materials

### Drift database

Library [drift](https://drift.simonbinder.eu/docs/getting-started/).

### Top tools

- [top-50-flutter-tools](https://apexive.com/post/top-50-flutter-tools)

```

```

    