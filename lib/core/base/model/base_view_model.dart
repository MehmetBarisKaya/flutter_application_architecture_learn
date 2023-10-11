import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manage.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/navigation_service.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

mixin BaseViewModel {
  late BuildContext viewModelContext;

  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager? localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init();
}
