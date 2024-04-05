import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/data/cars/remote/car_remote_data_source.dart';

@module
abstract class DataSourceModule {
  @LazySingleton(as: CarRemoteDataSource)
  CarRemoteDataSourceImpl get carRemoteDataSourceImpl;
}
