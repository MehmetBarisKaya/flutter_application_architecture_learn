// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:vexana/vexana.dart';

import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/ISocialService.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';

class SocialUserViewDetail extends StatelessWidget {
  SocialUserViewDetail({
    Key? key,
    required this.socialUser,
  }) : super(key: key);
  final SocialUser socialUser;
  final INetworkManager manager = VexanaManager.instance.networkManager;
  ISocialService get socialService => SocialService(manager, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialService.fetchUser(socialUser.id).ext.toBuild(
          onSuccess: (data) {
            return Center(
              child: Text(socialUser.title ?? ""),
            );
          },
          loadingWidget: CircularProgressIndicator(),
          notFoundWidget: Center(
            child: Text("NotFound"),
          ),
          onError: Text("error")),
    );
  }
}
