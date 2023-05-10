import 'package:app_structure/app/engine/page.routes.dart';
import 'package:app_structure/home/view/home.view.dart';
import 'package:app_structure/login/view/login.view.dart';
import 'package:app_structure/page_args/page_args.export.dart';
import 'package:flutter/cupertino.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Object? args;
  if (settings.arguments != null) {
    if (settings.arguments is Map) {
      args = (settings.arguments! as Map<String, dynamic>)
          .entries
          .toList()[0]
          .value;
    } else {
      args = settings.arguments;
    }
  }
  switch (settings.name) {
    case PageRoutes.routeLogin:
      return CupertinoPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) => const LoginPage(),
      );
    case PageRoutes.routeHome:
    default:
      return CupertinoPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) => HomePage(args: args! as HomePageArgs),
      );
  }
}
