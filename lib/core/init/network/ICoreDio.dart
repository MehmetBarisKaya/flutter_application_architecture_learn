import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetchData<R, T extends BaseModel>(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      required T parseModel,
      required HttpRequestTypes type,
      void Function(int, int)? onReceiveProgress});
}
