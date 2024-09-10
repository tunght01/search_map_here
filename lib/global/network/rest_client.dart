import 'dart:io';

import 'package:dio/dio.dart';

class RestClient {
  late Dio dio;

  RestClient();

  String handlerError(dynamic error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectionTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return 'Kết nối mạng không ổn định, vui lòng thử lại';
        default:
          return error.error is SocketException
              ? 'Vui lòng kiểm tra kết nối mạng'
              : 'Đã có lỗi xảy ra, vui lòng thử lại';
      }
    } else {
      return 'Đã có lỗi xảy ra, vui lòng thử lại';
    }
  }
}
