import 'dart:io';
import 'package:dio/dio.dart';
import 'dio_connectivity.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetry requestRetry;

  RetryOnConnectionChangeInterceptor({required this.requestRetry});

  @override
  Future onErrorrequest(DioError err) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetry.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
  }

  bool _shouldRetry(DioError error) {
    return error.type == DioErrorType.values &&
        error.error != null &&
        error.error is SocketException;
  }
}