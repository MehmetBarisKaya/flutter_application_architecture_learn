import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(baseUrl: "");
    _dio = Dio(baseOptions);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.path += "baris";
      },
      onResponse: (e, handler) {},
      onError: (e, handler) {
        BaseError(e.message!);
      },
    ));
  }
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late Dio _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromjson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromjson(responseBody as Map<String, Object>);
        }
        return responseBody;
      default:
    }
  }
}
