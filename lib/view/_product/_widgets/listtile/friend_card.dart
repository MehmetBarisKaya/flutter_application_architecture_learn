// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';

class FriendCard extends StatelessWidget {
  final SocialUser socialUser;
  final VoidCallback onPressed;
  const FriendCard({
    Key? key,
    required this.socialUser,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(socialUser.id.toString())),
      title: Text(socialUser.title ?? " "),
      subtitle: Text(socialUser.body ?? " "),
      onTap: onPressed,
      trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: context.general.colorScheme.error),
          onPressed: () {},
          child: Text(
            LocaleKeys.home_social_follow.locale,
            style: context.general.textTheme.labelMedium
                ?.copyWith(color: context.general.colorScheme.background),
          )),
    );
  }
}
