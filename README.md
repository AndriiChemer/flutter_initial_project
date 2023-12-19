# iteo_libraries_example

A new Flutter project.

## Generate auto_route
`fvm flutter packages pub run build_runner build`

### Build code-gen selected element using filter
`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/navigation/*.dart'`
`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/page/{page}/*.dart'`
### Example
`flutter pub run build_runner build --delete-conflicting-outputs --build-filter 'lib/presentation/page/main/*.dart'`

flutter pub run build_runner build --delete-conflicting-outputs