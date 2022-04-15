// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:dio/dio.dart';
//
// class DioConnectivityRequestRetry {
//   final Dio dio;
//   final Connectivity connectivity;
//
//   DioConnectivityRequestRetry({required this.dio, required this.connectivity});
//
//   Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
//     var _streamSubscription;
//     final responseCompleter = Completer<Response>();
//
//     _streamSubscription = connectivity.onConnectivityChanged.listen((event) {
//       if (event != ConnectivityResult.none) {
//         _streamSubscription.cancel();
//         responseCompleter.complete(
//             dio.request(requestOptions.path,
//                 cancelToken: requestOptions.cancelToken,
//                 data: requestOptions.data,
//                 onReceiveProgress: requestOptions.onReceiveProgress,
//                 onSendProgress: requestOptions.onSendProgress,
//                 queryParameters: requestOptions.queryParameters,
//                 options: Options()
//             ),
//         );
//       }
//     });
//     return responseCompleter.future;
//   }
// }