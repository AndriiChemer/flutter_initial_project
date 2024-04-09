export 'package:iteo_libraries_example/data/database/provider/unsupported.dart'
    if (dart.library.ffi) 'package:iteo_libraries_example/data/database/provider/native_database_provider.dart'
    if (dart.library.html) 'package:iteo_libraries_example/data/database/provider/web_wasm_database_provider.dart';
