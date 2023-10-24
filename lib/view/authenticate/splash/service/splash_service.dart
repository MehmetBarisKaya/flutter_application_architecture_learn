import 'package:fluttermvvmtemplate/view/_product/_mixin/network_helper.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/model/force_update_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/ISplashService.dart';
import 'package:vexana/vexana.dart';

enum SplashServerQuery { VERSION, PLATFORM }

extension SplashServerQueryExtension on SplashServerQuery {
  MapEntry<String, String> toMapValue(String value) {
    switch (this) {
      case SplashServerQuery.VERSION:
        return MapEntry("version", value);
      case SplashServerQuery.PLATFORM:
        return MapEntry("platform", value);
    }
  }

  String rawValue() {
    switch (this) {
      case SplashServerQuery.VERSION:
        return "/version";

      case SplashServerQuery.PLATFORM:
        return "";
    }
  }
}

class SplasService extends ISplashService with NetworkHelper {
  SplasService(super.networkManager, super.scaffoldKey);

  @override
  Future<ForceUpdateModel?> fetchVersion(
      {required String version, required String platform}) async {
    final response =
        await networkManager.send<ForceUpdateModel, ForceUpdateModel>(
            SplashServerQuery.VERSION.rawValue(),
            parseModel: ForceUpdateModel(),
            method: RequestType.GET,
            queryParameters: Map.fromEntries([
              SplashServerQuery.VERSION.toMapValue(version),
              SplashServerQuery.PLATFORM.toMapValue(platform),
            ]));
    return response.data;
  }
}
