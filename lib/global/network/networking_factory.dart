import 'package:dio/dio.dart';

class NetworkingFactory {
  static Dio createDio({
    required String baseUrl,
    HttpClientAdapter? httpClientAdapter,
    Duration? timeout = const Duration(seconds: 20),
    bool isDebug = false,
  }) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: timeout,
      receiveTimeout: timeout,
    ));

    if (httpClientAdapter != null) {
      dio.httpClientAdapter = httpClientAdapter;
    }

    if (isDebug) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }

    return dio;
  }
}
