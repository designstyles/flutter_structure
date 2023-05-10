import 'package:models/models.dart';
import 'package:services/services.dart' as service;

class StartupRepository {
  const StartupRepository();
  Future<bool> get isLoggedIn async {
    final _ = await service.AppInitialize.initializeAppData();
    // * add delay as we have no logic for validating if a user is logged in
    // * delay would determine how long to wait before executing 'then' logic.
    // * effectively, showing the Splash screen to the user
    return Future.delayed(
      const Duration(seconds: 1),
      () => null,
    ).then((value) {
      final savedValue = service.MemoryStorageService().getStorageValue<String>(
        storageKey: AppConsts.appStorageKeys.userDisplayNameKey,
      );
      return savedValue != null;
    });
  }
}
