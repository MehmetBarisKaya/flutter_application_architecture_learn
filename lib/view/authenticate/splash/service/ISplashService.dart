// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/model/force_update_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISplashService {
  final INetworkManager networkManager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  ISplashService(
    this.networkManager,
    this.scaffoldKey,
  );

  Future<ForceUpdateModel?> fetchVersion(
      {required String version, required String platform});
}
