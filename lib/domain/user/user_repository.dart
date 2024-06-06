import 'package:iteo_libraries_example/domain/user/user/user.dart';

abstract class UserRepository {
  Future<void> saveUser({
    required String name,
    required String surname,
    required String email,
  });

  Future<User?> getUser();
}
