import 'package:flutter/material.dart';
import '../../init/cache/locale_manage.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';
import '../../init/network/vexana_manager.dart';

mixin BaseViewModel {
  late BuildContext viewModelContext;
  VexanaManager? vexanaManager = VexanaManager.instance;
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager get VexanaManageComputed => VexanaManager.instance;
  LocaleManager? localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
