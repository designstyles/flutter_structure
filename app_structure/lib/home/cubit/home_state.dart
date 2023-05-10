part of 'home_cubit.dart';

class HomeInitial extends AppBaseState {
  HomeInitial() : super();
}

class HomeLoaded extends AppBaseSuccessState {
  HomeLoaded({
    super.appbarTitle,
    required this.countValue,
  });
  final int countValue;

  bool get isLoggedIn =>  MemoryStorageService().getStorageValue<String>(
            storageKey: AppConsts.appStorageKeys.userDisplayNameKey,
          ) != null;
}
