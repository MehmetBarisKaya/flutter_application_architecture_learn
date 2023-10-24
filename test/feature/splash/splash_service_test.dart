import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/ISplashService.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/splash_service.dart';

void main() {
  late ISplashService splashService;
  setUp(() {
    splashService = SplasService(VexanaManager.instance.networkManager, null);
  });
  test('Fetch Version', () {
    final response =
        splashService.fetchVersion(version: "0.0.9", platform: "1");
    expect(response, isNotEmpty);
  });
}
