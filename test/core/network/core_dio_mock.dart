import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/extension/network_extension.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';

class CoreDioMock extends ICoreDioFull with DioMixin {
  @override
  final BaseOptions options;

  CoreDioMock(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = IOHttpClientAdapter();
  }
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(String path,
      {required HttpRequestTypes type,
      required BaseModel<T> parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));

    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(
            error: BaseError(response.statusMessage!) as dynamic);
    }
  }

  @override
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(String path,
      {HttpRequestTypes? type,
      T? parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final dumyJson = '''[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit suscipit recusandae consequuntur expedita et cumnreprehenderit molestiae ut ut quas totamnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitaensequi sint nihil reprehenderit dolor beatae ea dolores nequenfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendisnqui aperiam non debitis possimus qui neque nisi nulla"
  }]''';
    final response = jsonDecode(dumyJson);
    final model = _responseParser<R, T>(parseModel, response);
    return ResponseModel<R>(data: model);
  }

  R? _responseParser<R, T>(BaseModel? model, dynamic data) {
    if (data is List) {
      return data.map((e) => model!.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model!.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }
}
