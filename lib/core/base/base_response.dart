import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../utils/utils.dart';
import '../core.dart';

abstract class BaseResponse {
  int statusCode;
  AppError? error;

  bool get success => statusCode == 200 || statusCode == 201;

  BaseResponse({this.statusCode = 0});

  external T fromJson<T extends BaseResponse>(Map<String, dynamic> json);

  toModel() {}
}

class SingleResponse<T extends BaseResponse> extends BaseResponse {
  T? item;

  SingleResponse(this.item, {int? statusCode})
      : super(statusCode: statusCode ?? 0);

  @override
  bool get success => statusCode == 200 || statusCode == 201;

  SingleResponse.fromJson(Response response) {
    statusCode = response.statusCode ?? 0;

    final map = JsonUtils.getMap(response.data);
    if (success) {
      final result = GetIt.I.get<T>();

      item = result.fromJson<T>(map);
    } else {
      error = AppError.asAppError(statusCode);
    }
  }

  SingleResponse.failure(Object? error) {
    statusCode = 500;
    error = AppError.asAppError(error);
  }

  Result<M> toResult<M>() {
    return Result<M>(isSuccess: success, error: error, item: item?.toModel());
  }
}
