import 'dart:async';
import 'dart:developer';

import 'package:app_structure/app/engine/locator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loggy/loggy.dart';
import 'package:models/models.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor:
              SystemUiOverlayStyle.dark.systemNavigationBarColor,
        ),
      );

      Loggy.initLoggy();
      setupLocator();

      await GetStorage.init(AppConsts.appStorageKeys.storageBoxKey);
      FlutterError.onError = (FlutterErrorDetails details) {
        debugPrint(
          'ERROR 1',
        );
        debugPrint('Library :  ${details.library}');
        debugPrint("Description :  ${details.context?.toDescription() ?? ''}");
        debugPrint("Level :  ${details.context?.level.toString() ?? ''}");
        debugPrint('Error :  ${details.exception}');
      };
      runApp(await builder());
    },
    (error, stackTrace) {
      logError(error.toString());
      logError(stackTrace);
    },
  );
}
