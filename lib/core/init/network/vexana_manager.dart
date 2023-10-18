import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instance;
  static VexanaManager get instance {
    _instance ??= VexanaManager._init();
    return _instance!;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager<Null>(
      isEnableLogger: true,
      options: BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
}
