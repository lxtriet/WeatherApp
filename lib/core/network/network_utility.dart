import 'package:dio/dio.dart';

abstract class INetworkUtility {
  Future<Response> request(
    String url,
    Method method, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
  });

  Future<Response> download({
    required String url,
    required String savePath,
    dynamic data,
    Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  });
}

class NetworkUtility implements INetworkUtility {
  late Dio _dio;

  final String baseUrl;
  final List<Interceptor>? interceptors;
  final ResponseType responseType;

  NetworkUtility(
    this.baseUrl, {
    this.interceptors,
    this.responseType = ResponseType.plain,
    int connectTimeout = 120000,
    int receiveTimeout = 120000,
    int sendTimeout = 120000,
  }) {
    BaseOptions options = BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      responseType: responseType,
      headers: {},
      validateStatus: (_) {
        return true;
      },
      baseUrl: baseUrl,
    );
    _dio = Dio(options);

    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors!);
    }
  }

  Future<Response> _createRequest(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    options ??= Options(headers: {});
    options.method = method;

    Response response;
    try {
      response = await _dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } catch (e, _) {
      rethrow;
    }
    return response;
  }

  @override
  Future<Response> request(
    String url,
    Method method, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    return await _createRequest(
      method.value,
      url,
      data: data,
      options: options,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> download({
    required String url,
    required String savePath,
    dynamic data,
    Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    return await _dio.download(
      url,
      savePath,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      options: options,
    );
  }
}

enum Method {
  POST,
  PUT,
  DELETE,
  GET,
}

extension MethodExtensions on Method {
  String get value => ['POST', 'PUT', 'DELETE', 'GET'][index];
}
