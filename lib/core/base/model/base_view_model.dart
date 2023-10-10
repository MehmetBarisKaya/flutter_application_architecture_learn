import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/network/ICoreDio.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_manager.dart';

mixin BaseViewModel {
  late BuildContext viewModelContext;

  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  void setContext(BuildContext context);
  void init();
}
