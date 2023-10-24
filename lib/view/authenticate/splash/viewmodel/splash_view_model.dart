import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => viewModelContext = context;

  @observable
  bool isFirstInit = true;

  void init() {
    startAnimationOnView();
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
