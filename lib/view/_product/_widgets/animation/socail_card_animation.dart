// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/social/view/social_user_view_detail.dart';

import '../../../home/social/model/social_user_model.dart';

class OpenContainerSocailWrapper extends StatelessWidget {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  const OpenContainerSocailWrapper({
    required this.closedBuilder,
    this.onClosed,
    required this.socialUser,
  });

  final CloseContainerBuilder closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final SocialUser socialUser;
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return SocialUserViewDetail(
          socialUser: socialUser,
        );
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
