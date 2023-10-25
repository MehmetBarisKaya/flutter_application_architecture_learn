import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/product/enum/platform_project_enum.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/model/force_update_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/ISplashService.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/service/splash_service.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/init/cache/locale_manage.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  bool isFirstInit = true;
  ISplashService? splashService;

  void init() {
    startAnimationOnView();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controlAppState();
    });
  }

  Future<void> controlAppState() async {
    await _deviceAndCacheInit();
    //MARK
    final data = await compute((message) => _UserVersionCreate.createNumber, 1);
    print(data);
    _networkInit();
    final isNeedForceUpdate = await _checkAppVersion();
    if (isNeedForceUpdate) {
      showAboutDialog(context: viewModelContext, children: [
        Text("Need Update"),
      ]);
    }
  }

  Future<void> _deviceAndCacheInit() async {
    await Future.wait([
      LocaleManager.prefrencesInit(),
      DeviceUtility.instance.initPackageInfo(),
    ]);
  }

  void _networkInit() {
    if (vexanaManager != null) {
      splashService = SplasService(VexanaManageComputed.networkManager, null);
    }
  }

  Future<bool> _checkAppVersion() async {
    final response = await splashService?.fetchVersion(
        version: ''.ext.version,
        platform: "${PlatformProjectEnum.ANDROID.versionNumber}");
    if (response is ForceUpdateModel) {
      return response.isForceUpdate ?? false;
    } else {
      return false;
    }
  }

  Future<void> startAnimationOnView() async {
    await Future.delayed(viewModelContext.duration.durationLow);
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }
}

class _UserVersionCreate {
  static String createNumber(int number) {
    final model = ForceUpdateModel(currentVersion: '1.0.3');
    final data = jsonEncode(model);
    final lastData = jsonDecode(data);
    if (lastData is Map<String, dynamic>) {
      return ForceUpdateModel().fromJson(lastData).currentVersion ?? '';
    }
    // throw
    return '';
  }
}
