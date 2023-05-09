class StorageKeys {
  const StorageKeys();
  String get storageBoxKey => _StorageKeys.storageBoxName;
}

class _StorageKeys {
  _StorageKeys._();
  static const String storageBoxName = 'MyBoxData';
}
