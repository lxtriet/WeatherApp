import 'dart:io';

import 'package:dio/dio.dart';

enum AppError {
  Network,

  Server,

  NotFound,

  Unknown;

  static AppError asAppError(Object? error) {
    if (isNetworkException(error)) {
      return AppError.Network;
    }
    if (error is int) {
      return mapIntToError(error);
    }
    return AppError.Unknown;
  }

  static bool isNetworkException(Object? error) {
    return error is SocketException ||
        error is HandshakeException ||
        error is DioError ||
        error is HttpException;
  }

  static AppError mapIntToError(int? code) {
    switch (code) {
      case 404:
        return AppError.NotFound;
      case 401:
        return AppError.Server;
      default:
        return AppError.Unknown;
    }
  }
}
