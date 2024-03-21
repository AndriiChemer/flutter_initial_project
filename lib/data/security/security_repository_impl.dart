import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iteo_libraries_example/data/security/failed_to_generate_secure_password_exception.dart';
import 'package:iteo_libraries_example/domain/security/security_repository.dart';

const _passwordStorageKey = 'database_password';

final class SecurityRepositoryImpl implements SecurityRepository {
  SecurityRepositoryImpl(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  @override
  Future<String> generateDatabasePassword([int length = 128]) async {
    return await compute(_generateDatabasePassword, length);
  }

  @override
  Future<String?> getDatabasePassword() =>
      _secureStorage.read(key: _passwordStorageKey);

  @override
  Future<void> setDatabasePassword(String password) =>
      _secureStorage.write(key: _passwordStorageKey, value: password);

  @override
  Future<void> deleteDatabasePassword() =>
      _secureStorage.delete(key: _passwordStorageKey);

  /// [math.Random.secure] is a cryptographically secure random number generator
  ///
  /// [FailedToGenerateSecurePasswordException] this fails if secure random is not available,
  ///  which can be the case on some devices
  Future<String> _generateDatabasePassword(int length) async {
    try {
      final random = math.Random.secure();
      final password = List.generate(length, (_) => random.nextInt(33) + 89)
          .join();

      return password;
    } catch (e) {
      throw const FailedToGenerateSecurePasswordException();
    }
  }
}
