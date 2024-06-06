import 'package:iteo_libraries_example/data/user/local/entity/user_entity.gen.dart';
import 'package:iteo_libraries_example/data/user/local/user_local_storage_impl.dart';
import 'package:iteo_libraries_example/domain/user/user/user.dart';
import 'package:iteo_libraries_example/domain/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.userLocalStorage);

  final UserLocalStorage userLocalStorage;

  @override
  Future<User?> getUser() async {
    final userEntity = await userLocalStorage.getUser();
    return userEntity?.toUser();
  }

  @override
  Future<void> saveUser({
    required String name,
    required String surname,
    required String email,
  }) async {
    final userEntity = UserEntity(
      name: name,
      surname: surname,
      email: email,
    );
    await userLocalStorage.saveUser(userEntity);
  }
}
