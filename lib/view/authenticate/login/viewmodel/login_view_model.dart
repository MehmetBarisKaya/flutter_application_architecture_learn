import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../service/ILoginService.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void setContext(BuildContext context) => viewModelContext = context;

  @override
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchLoginService() async {
    changeLoading();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController.text, password: passwordController.text));
      if (response != null) {
        scaffoldState.currentState
            ?.showBottomSheet((context) => Text(response.token!));
        localeManager?.setStringValue(PreferencesKeys.TOKEN, response.token!);
      }
    }

    changeLoading();
  }
}
