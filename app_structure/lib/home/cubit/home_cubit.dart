import 'package:app_structure/app/engine/navigator.dart';
import 'package:app_structure/app/engine/page.routes.dart';
import 'package:app_structure/page_args/home_view_args.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:models/models.dart';
import 'package:repositories/repositories.dart';
import 'package:services/services.dart';

part 'home_state.dart';

class HomeCubit extends AppBaseCubit {
  HomeCubit({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(HomeInitial());

  final HomeRepository _homeRepository;

  void initializeView({required bool isLoggedIn}) {
    final title = isLoggedIn
        ? MemoryStorageService().getStorageValue<String>(
            storageKey: AppConsts.appStorageKeys.userDisplayNameKey,
          )
        : 'Free User';
    emit(
      HomeLoaded(
        appbarTitle: title,
        countValue: 0,
      ),
    );
  }

  void increment() {
    final currentState = state;
    emit(
      HomeLoaded(
        appbarTitle: state.appbarTitle,
        countValue: (currentState as HomeLoaded).countValue + 1,
      ),
    );
  }

  void decrement() {
    final currentState = state;
    emit(
      HomeLoaded(
        appbarTitle: state.appbarTitle,
        countValue: (currentState as HomeLoaded).countValue - 1,
      ),
    );
  }

  Future<void> login() async {
    await Navi.goTo(pageRoute: PageRoutes.routeLogin);
  }

  Future<void> logout() async {
    await _homeRepository.logout();
    await Navi.clearStackToPage(
      pageRoute: PageRoutes.routeHome,
      objArgs: const HomePageArgs.load(
        isLoggedIn: false,
      ),
    );
  }

  @override
  Future<void> retry() async {}
}
