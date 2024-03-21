abstract interface class SecurityRepository {
  Future<String?> getDatabasePassword();

  Future<String> generateDatabasePassword([int length = 128]);

  Future<void> setDatabasePassword(String password);

  Future<void> deleteDatabasePassword();
}
