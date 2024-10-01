# iteo_libraries_example

A new Flutter project.

## Generate auto_route

`fvm flutter packages pub run build_runner build`

### Build code-gen selected element using filter

`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/navigation/*.dart'`
`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/page/{page}/*.dart'`

### Example

`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/page/main/*.dart'`
`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/data/cars/dto/*.dart'`

flutter pub run build_runner build --delete-conflicting-outputs

### Problem with build_runner

https://sulthanalihsan.medium.com/failed-to-build-build-runner-method-not-found-fallthrougherror-pub-semver-a21f5dcdb7ad

```
flutter clean
flutter packages pub get
```

### Translations

`flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart`

## Tests

### Golden test

Run all golden tests:

```
flutter test --update-goldens --tags=golden
```

## Materials

### Drift (database)

https://drift.simonbinder.eu/docs/getting-started/

### Top tools

- https://apexive.com/post/top-50-flutter-tools
