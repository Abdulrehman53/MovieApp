import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AppConfig {
  static String baseUrl = "https://9gag.com/v1/";
}
enum HttpMethod { Get, Post, Put, Patch, Delete }

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();
  factory NetworkManager() {
    return _singleton;
  }
  NetworkManager._internal();

  Dio dio = Dio();
  void setDioOptions() {
    dio.options.contentType = Headers.jsonContentType;
  }

  Future<Response?> callApi({
    required HttpMethod method,
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    dynamic? body,
    bool isFormDataRequest = false,
    FormData? formData,
    bool isLoading = true,
    bool isGetCookie = false,
  }) async {
    setDioOptions();

  

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    final requestURL =
        AppConfig.baseUrl + urlEndPoint;
    Response? response;
    try {
      switch (method) {
        case HttpMethod.Get:
          response = await dio.get(
            requestURL,
            queryParameters: queryParameters,
            options: options,
          );
          break;
        case HttpMethod.Post:
          response = await dio.post(
            requestURL,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            data: isFormDataRequest ? formData : body,
          );
          break;
        case HttpMethod.Put:
          response = await dio.put(
            requestURL,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
            data: body,
          );
          break;
        case HttpMethod.Patch:
          break;
        case HttpMethod.Delete:
          response = await dio.delete(requestURL, data: body);
          break;
      }
      
      return response;
      // }
    } catch (error) {

    }
  }
}

