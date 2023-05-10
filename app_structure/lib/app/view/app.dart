import 'package:any_loading/any_loading.dart';
import 'package:app_structure/app/engine/router.dart' as router;
import 'package:app_structure/startup/cubit/startup_cubit.dart';
import 'package:app_structure/startup/view/startup.view.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:theme_provider/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: const HomeRepository()),
        RepositoryProvider.value(value: const LoginRepository()),
        RepositoryProvider.value(value: const StartupRepository()),
      ],
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView();

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        final savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          final platformBrightness =
              SchedulerBinding.instance.window.platformBrightness;
          if (platformBrightness == Brightness.dark) {
            controller.setTheme('dark');
          } else {
            controller.setTheme('light');
          }
          await controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        AppTheme.light(
          id: 'light',
        ),
        AppTheme.dark(
          id: 'dark',
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: StackedService.navigatorKey,
              onGenerateRoute: router.generateRoute,
              theme: ThemeProvider.themeOf(themeContext).data,
              title: 'App Structured',
              home: BlocProvider(
                lazy: false,
                create: (_) => StartupCubit(
                  startupRepository: context.read<StartupRepository>(),
                )..startUpApp(),
                child: const DoubleBack(
                  waitForSecondBackPress: 3,
                  child: StartupPage(),
                ),
              ),
              builder: AnyLoading.init(),
            );
          },
        ),
      ),
    );
  }
}
