import 'package:services/services.dart';

class HomeRepository {
  const HomeRepository();

  Future<void> logout() async {
    return MemoryStorageService().clearGetStorage();
  }
}
