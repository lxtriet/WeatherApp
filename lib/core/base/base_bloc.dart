import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../core.dart';

abstract class BlocCommand {}

class NoCommand extends BlocCommand {}

class NoState {}

class NoBloc extends BaseBloc<NoState, NoCommand> {}

abstract class BaseBloc<T extends dynamic, C extends BlocCommand> {
  BaseBloc({T? state}) {
    _controller = BehaviorSubject<T>();
    _commandController = BehaviorSubject<C>();
    _errorController = BehaviorSubject<Object?>();
    if (state != null) {
      _controller.add(state);
    }
  }

  bool get isNetworkConnectionAvailable =>
      GetIt.I.get<ConnectivityService>().hasInternetConnection;

  late BehaviorSubject<T> _controller;
  late BehaviorSubject<Object?> _errorController;
  late BehaviorSubject<C> _commandController;

  Stream<T> get stateStream => _controller.stream;
  Stream<Object?> get errorStream => _errorController.stream;
  Stream<C> get commandStream => _commandController.stream;

  T? get state {
    if (_controller.hasValue) {
      return _controller.value;
    }
    return null;
  }

  @mustCallSuper
  void init() {}

  @mustCallSuper
  void dispose() async {
    await _controller.drain();
    await _commandController.drain();
    await _errorController.drain();
    _controller.close();
    _errorController.close();
    _commandController.close();
  }

  @mustCallSuper
  void onResume() {}

  @mustCallSuper
  void onPause() {}

  @mustCallSuper
  void onDetach() {}

  @mustCallSuper
  void onInactive() {}

  void emit(T state) {
    if (_controller.isClosed) return;
    _controller.sink.add(state);
  }

  void emitCommand(C event) {
    if (_commandController.isClosed) return;
    _commandController.sink.add(event);
  }

  void emitError(Object? error) {
    if (error == null) return;
    if (_errorController.isClosed) return;
    _errorController.sink.add(AppError.asAppError(error));
  }

  bool isNetWorkException(dynamic exception) {
    if (exception is DioError) {
      return exception.error is SocketException;
    }
    return false;
  }
}
