import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';

import '../../model/model_test.dart';
import 'core_dio_mock.dart';

void main() {
  late ICoreDioFull service;
  setUp(() {
    service = CoreDioMock(
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  });
  test('Core Dio List', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>("/posts",
        parseModel: PostModel(), type: HttpRequestTypes.GET);
    expect(data.data, isList);
  });
  test('Core Dio NoNetwork', () async {
    final data = await service.fetchNoNetwork<List<PostModel>, PostModel>(
        "/posts",
        parseModel: PostModel(),
        type: HttpRequestTypes.GET);
    expect(data.data, isList);
  });

  test('Core Dio Object', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>("/posts",
        parseModel: PostModel(), type: HttpRequestTypes.GET);
    expect(data.data, isList);
  });

  test('Core Dio Primitive', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>("/posts",
        parseModel: PostModel(), type: HttpRequestTypes.GET);
    expect(data.data, isList);
  });

  test('Core Dio Error', () async {
    final data = await service.fetchData<List<PostModel>, PostModel>("/posts",
        parseModel: PostModel(), type: HttpRequestTypes.GET);
    expect(data.data, isList);
  });
}
