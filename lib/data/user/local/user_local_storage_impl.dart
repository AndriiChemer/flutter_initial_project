import 'dart:convert';

import 'package:iteo_libraries_example/data/user/local/entity/user_entity.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _userKey = 'user';

abstract class UserLocalStorage {
  Future<UserEntity?> getUser();

  Future<void> saveUser(UserEntity userEntity);
}

class UserLocalStorageImpl implements UserLocalStorage {
  UserLocalStorageImpl(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Future<UserEntity?> getUser() async {
    final stringValue = sharedPreferences.getString(_userKey);

    if (stringValue != null) {
      final jsonMap = jsonDecode(stringValue) as Map<String, dynamic>;
      return UserEntity.fromJson(jsonMap);
    }

    return null;
  }

  @override
  Future<void> saveUser(UserEntity userEntity) async {
    final jsonString = jsonEncode(userEntity.toJson());
    await sharedPreferences.setString(_userKey, jsonString);
  }
}
