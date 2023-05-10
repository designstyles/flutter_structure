import 'package:any_loading/any_loading.dart';
import 'package:app_structure/shared/data/cubit_state.dart';
import 'package:app_structure/shared/widgets/crossfade.backgroud.dart';
import 'package:app_structure/shared/widgets/fade.in.animation.dart';
import 'package:app_structure/shared/widgets/global.error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenericScafold<C extends AppBaseCubit> extends StatelessWidget {
  const GenericScafold({
    super.key,
    required this.successChild,
    required this.getScaffoldTitle,
    required this.getFutureBuilder,
    required this.retryFailed,
    this.getScaffoldActions = const <Widget>[],
    this.getBottomAppBar,
    this.fabActionButton,
    this.showAppBar = true,
    this.failedChildOverride,
  });

  final Widget successChild;
  final Widget? failedChildOverride;
  final Widget? fabActionButton;
  final String Function() getScaffoldTitle;
  final PreferredSize? Function()? getBottomAppBar;
  final VoidCallback retryFailed;
  final Future<bool> Function(BuildContext) getFutureBuilder;
  final List<Widget>? getScaffoldActions;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFutureBuilder(context),
      builder: (context, snapshot) {
        return _Scafold<C>(
          getScaffoldTitle: getScaffoldTitle,
          getScaffoldActions: getScaffoldActions ?? [],
          showAppBar: showAppBar,
          successChild: successChild,
          retryFailed: retryFailed,
          failedChildOverride: failedChildOverride,
          getBottomAppBar: getBottomAppBar,
          fabActionButton: fabActionButton,
        );
      },
    );
  }
}

class _Scafold<C extends AppBaseCubit> extends StatelessWidget {
  const _Scafold({
    required this.successChild,
    required this.getScaffoldTitle,
    required this.getScaffoldActions,
    required this.showAppBar,
    required this.getBottomAppBar,
    required this.retryFailed,
    this.failedChildOverride,
    this.fabActionButton,
  });

  final Widget successChild;
  final Widget? failedChildOverride;
  final Widget? fabActionButton;
  final String Function() getScaffoldTitle;
  final PreferredSize? Function()? getBottomAppBar;
  final VoidCallback retryFailed;
  final List<Widget> getScaffoldActions;
  final bool showAppBar;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: showAppBar
            ? AppBar(
                //backgroundColor: Theme.of(context).colorScheme.tertiary,
                // iconTheme: IconThemeData(
                //   color: Theme.of(context).primaryTextTheme
                // .bodyText2!.color!,
                // ),
                title: Center(
                  child: FadeIn(
                    fadeDirection: FadeDirection.bottomToTop,
                    duration: const Duration(seconds: 2),
                    child: Text(
                      getScaffoldTitle.call(),
                      // style: TextStyle(
                      //   color: Theme.of(context)
                      //       .primaryTextTheme
                      //       .bodyText2!
                      //       .color,
                      // ),
                    ),
                  ),
                ),
                actions: getScaffoldActions,
                bottom: getBottomAppBar?.call(),
              )
            : null,
        body: SafeArea(
          child: _StackedBackground<C>(
            successChild: successChild,
            retryFailed: retryFailed,
            failedChildOverride: failedChildOverride,
          ),
        ),
        // ignore: unnecessary_null_in_if_null_operators
        floatingActionButton: fabActionButton ?? null,
      ),
    );
  }
}

class _StackedBackground<C extends AppBaseCubit> extends StatelessWidget {
  const _StackedBackground({
    required this.successChild,
    required this.retryFailed,
    this.failedChildOverride,
  });

  final Widget successChild;
  final Widget? failedChildOverride;
  final VoidCallback retryFailed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundCrossfade(),
        _ViewBuilder<C>(
          successChild: successChild,
          retryFailed: retryFailed,
          failedChildOverride: failedChildOverride,
        ),
      ],
    );
  }
}

class _ViewBuilder<C extends AppBaseCubit> extends StatelessWidget {
  const _ViewBuilder({
    required this.successChild,
    required this.retryFailed,
    this.failedChildOverride,
  });

  final Widget successChild;
  final Widget? failedChildOverride;
  final VoidCallback retryFailed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, AppBaseState>(
      listener: (context, state) {
        if (state is AppBaseLoadingState) {
          AnyLoading.showLoading(
            title: 'Loading',
            maskType: AnyLoadingMaskType.black,
            style: AnyLoadingStyle.dark(),
          );
        } else {
          AnyLoading.dismiss();
        }
      },
      builder: (context, state) {
        if (state is AppBaseFailedState) {
          if (failedChildOverride != null) {
            return failedChildOverride!;
          }
          return DisplayErrorWidget(
            errorMessage: state.errorMessage,
            retryOnTap: retryFailed,
          );
        }

        if (state is AppBaseSuccessState) {
          return successChild;
        }

        return const SizedBox.shrink();
      },
    );
  }
}
