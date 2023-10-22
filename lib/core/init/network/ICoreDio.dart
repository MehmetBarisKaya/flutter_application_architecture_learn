import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(String path,
      {required HttpRequestTypes type,
      required BaseModel<T> parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
    String path, {
    required HttpRequestTypes type,
    required T parseModel,
    dynamic data,
    Map<String, Object>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  });
}
