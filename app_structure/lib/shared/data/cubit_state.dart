import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

abstract class AppBaseCubit extends Cubit<AppBaseState> {
  AppBaseCubit(this.stateValue) : super(stateValue);

  final AppBaseState stateValue;
  @protected
  Future<void> retry();
}

abstract class AppBaseState {
  AppBaseState({
    this.errorMessage = '',
    this.appbarTitle = '',
  });
  String errorMessage;
  String appbarTitle;
}

abstract class AppBaseInitArgsState extends AppBaseState {
  AppBaseInitArgsState({String? appbarTitle})
      : super(appbarTitle: appbarTitle ?? '');
}

abstract class AppBaseLoadingState extends AppBaseState {
  AppBaseLoadingState({String? appbarTitle})
      : super(appbarTitle: appbarTitle ?? '');
}

abstract class AppBaseFailedState extends AppBaseState {
  AppBaseFailedState(String errorMessage, String appbarTitle)
      : super(errorMessage: errorMessage, appbarTitle: appbarTitle);
}

abstract class AppBaseSuccessState extends AppBaseState {
  AppBaseSuccessState({String? appbarTitle})
      : super(appbarTitle: appbarTitle ?? '');
}
