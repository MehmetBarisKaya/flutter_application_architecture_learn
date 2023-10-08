import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/app_theme_enum.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifier.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/model/test_model.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;
late final BuildContext maincontext;

void setContext(BuildContext context) {
  maincontext = context;
}

abstract class _TestViewModelBase with Store {
  @observable
  int number = 0;

  @observable
  bool isLoading = false;

  @computed
  bool get isEven => number.isEven;

  @action
  void increment() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(maincontext, listen: false)
        .changeTheme(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    await NetworkManager.instance.dioGet<TestModel>("x", TestModel());
    isLoading = false;
  }
}
