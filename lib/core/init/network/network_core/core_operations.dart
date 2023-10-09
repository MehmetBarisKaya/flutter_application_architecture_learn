part of "../core_dio.dart";

extension _CoreDioOperations on CoreDio {
  R _responseParser<R>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromjson(e)).toList() as R;
    } else if (data is Map) {
      return model.fromjson(data as Map<String, Object>) as R;
    }
    return data as R;
  }
}
