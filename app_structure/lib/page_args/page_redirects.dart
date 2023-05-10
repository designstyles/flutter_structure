import 'package:app_structure/app/view/splash.dart';
import 'package:app_structure/home/view/home.view.dart';
import 'package:app_structure/page_args/home_view_args.dart';
import 'package:flutter/material.dart';

Page<dynamic> showHomePage({required bool isLoggedIn}) => MaterialPage<void>(
      child: HomePage(
        args: HomePageArgs.load(isLoggedIn: isLoggedIn),
      ),
    );
Page<dynamic> showSplashPage() =>
    const MaterialPage<void>(child: SplashScreen());
