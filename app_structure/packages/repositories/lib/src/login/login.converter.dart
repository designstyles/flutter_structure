import 'package:models/models.dart';
import 'package:services/services.dart';

class LoginConverter {
  Future<void> setUserDetails(ApiAuthentication authenticatedDetails) async {
    await _setAuthToken(authenticatedDetails.token!);
    await _setDisplayName(authenticatedDetails.displayName!);
  }

  Future<void> _setAuthToken(String token) async {
    await MemoryStorageService().setStorageValue(
      storageKey: AppConsts.appStorageKeys.authJwtToken,
      storageItem: token,
    );
  }

  Future<void> _setDisplayName(String displayName) async {
    await MemoryStorageService().setStorageValue(
      storageKey: AppConsts.appStorageKeys.userDisplayNameKey,
      storageItem: displayName,
    );
  }
}
