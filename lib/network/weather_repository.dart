import 'dart:convert';

import 'package:dio/dio.dart';

class WeatherRepository {
  final String uri;
  final Map<String, dynamic>? payLoad;

  WeatherRepository({required this.uri, this.payLoad, payload});

  final Dio _dio = Dio();

  void get(
      {Function()? onLoading,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) {
    _dio.get(uri, queryParameters: payLoad).then((response) {
      if (onLoading != null) {
        response.data;
      }
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }

  Future getData() async {
    final response = await Dio().get('$uri');
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.toString());
      return data;
    } else {
      print(response.statusCode);
    }
  }

// void getRefreshInternet() {
//   Dio().interceptors.add(
//         RetryOnConnectionChangeInterceptor(
//           requestRetry: DioConnectivityRequestRetry(
//               dio: Dio(), connectivity: Connectivity()),
//         ),
//       );
// }

}
