import 'package:get_storage/get_storage.dart';
import 'package:models/models.dart';

class MemoryStorageService {
  Future<void> setStorageValue({
    required String storageKey,
    required String storageItem,
  }) async {
    final box = GetStorage(AppConsts.appStorageKeys.storageBoxKey);
    await box.write(storageKey, storageItem);
  }

  T? getStorageValue<T>({required String storageKey}) {
    final box = GetStorage(AppConsts.appStorageKeys.storageBoxKey);
    final keys = box.hasData(storageKey);
    if (keys) {
      // override <String> with values, as you add new keys
      //e.g
      // if (storageKey == ppConsts.appStorageKeys.someValueUsedAsDouble) {
      //   final savedValue = box.read<double>(storageKey);
      //   return savedValue! as T;
      // }
      final savedValue = box.read<String>(storageKey);
      return savedValue as T;
    }
    return null;
  }

  Future<void> clearGetStorage() async {
    final box = GetStorage(AppConsts.appStorageKeys.storageBoxKey);
    await box.erase();
  }
}
