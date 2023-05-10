// ignore_for_file: inference_failure_on_function_invocation

import 'package:app_structure/app/engine/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class Navi {
  static Future<void> clearStackToPage({
    required String pageRoute,
    Object? objArgs,
  }) async {
    final navigationService = locator<NavigationService>();

    await navigationService.clearStackAndShow(pageRoute, arguments: objArgs);
  }

  static Future<void> goTo({
    required String pageRoute,
    Object? objArgs,
  }) async {
    final navigationService = locator<NavigationService>();

    await navigationService.navigateTo(pageRoute, arguments: objArgs);
  }
}
