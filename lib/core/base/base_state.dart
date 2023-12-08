import 'dart:async';

import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import '../../resources/resources.dart';
import '../../utils/utils.dart';
import '../core.dart';

abstract class BaseState<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> {
  bool get resizeToAvoidBottomInset => false;

  final List<StreamSubscription> _subscribers = [];

  B get bloc;

  @override
  void initState() {
    bloc.init();
    registerSubscriber(bloc.stateStream.listen((state) {
      if (mounted) {
        stateListener(state);
      }
    }));
    registerSubscriber(
      bloc.commandStream.listen((command) {
        if (mounted) {
          commandListener(command);
        }
      }),
    );
    registerSubscriber(
      bloc.errorStream.listen((error) {
        if (mounted) {
          if (error is AppError) {
            _showAlertError(error);
          }
        }
      }),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages = false;
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: AppColors.santaBlack1,
      body: SafeArea(
        child: buildContent(context),
      ),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    for (var subscriber in _subscribers) {
      subscriber.cancel();
    }
    super.dispose();
  }

  void dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void registerSubscriber(StreamSubscription? subscriber) {
    if (subscriber == null) return;
    _subscribers.add(subscriber);
  }

  Widget buildContent(BuildContext context) => Container();

  // override this function to listen event change
  void stateListener(dynamic state) {}

  // override this function to listen command change
  void commandListener(BlocCommand command) {}

  void _showAlertError(AppError error) {
    error.asAlertUiState().show(context, onConfirmClicked: () {
      SystemNavigationUtils.exitApp();
    });
  }
}
