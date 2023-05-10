class StorageKeys {
  const StorageKeys();
  String get storageBoxKey => _StorageKeys.storageBoxName;
  String get userDisplayNameKey => _StorageKeys.userDisplayName;
  String get authJwtToken => _StorageKeys.authJwtToken;
}

class _StorageKeys {
  _StorageKeys._();
  static const String storageBoxName = 'MyBoxData';
  static const String userDisplayName = 'userDisplayName';
  static const String authJwtToken = 'jwtToken';
}
