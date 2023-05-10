import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:bloc/bloc.dart';
import 'package:repositories/repositories.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<AppBaseState> {
  StartupCubit({
    required StartupRepository startupRepository,
  })  : _startupRepository = startupRepository,
        super(StartingUp());

  final StartupRepository _startupRepository;

  Future<void> startUpApp() async {
    if (await _startupRepository.isLoggedIn) {
      emit(
        StartupLoggedIn(),
      );
    } else {
      emit(
        StartupLoggedOut(),
      );
    }
  }
}
