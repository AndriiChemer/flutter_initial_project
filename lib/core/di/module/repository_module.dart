import 'package:injectable/injectable.dart';
import 'package:iteo_libraries_example/data/cars/car_local_repository_impl.dart';
import 'package:iteo_libraries_example/data/cars/car_repository_impl.dart';
import 'package:iteo_libraries_example/data/cars/mapper/car_dto_to_car_mapper.dart';
import 'package:iteo_libraries_example/data/deep_link/deep_link_repository_impl.dart';
import 'package:iteo_libraries_example/data/security/security_repository_impl.dart';
import 'package:iteo_libraries_example/domain/cars/car_local_repository.dart';
import 'package:iteo_libraries_example/domain/cars/car_repository.dart';
import 'package:iteo_libraries_example/domain/deep_link/deep_link_repository.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';

@module
abstract class RepositoryModule {
  @injectable
  CarDTOToCarMapper get carDTOToCarMapper;

  @LazySingleton(as: CarRepository)
  CarRepositoryImpl get carRepository;

  @LazySingleton(as: DeepLinkRepository)
  DeepLinkRepositoryImpl get deepLinkRepository;
  
  @LazySingleton(as: SecurityRepository)
  SecurityRepositoryImpl get securityRepository;
  
  @LazySingleton(as: CarLocalRepository)
  CarLocalRepositoryImpl get carLocalRepository;
}
