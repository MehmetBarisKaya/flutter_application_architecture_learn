// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/user_friend_query.dart';
import 'package:vexana/vexana.dart';

import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';

abstract class ISocialService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldyKey;
  Future<List<SocialUser>?> fetchUserHouseList(FriendQuery friendQuery);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser?> fetchUser(id);

  ISocialService(
    this.manager,
    this.scaffoldyKey,
  );
}
