// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:kartal/kartal.dart';

import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';

class HeaderButton extends StatelessWidget {
  final String titleText;
  final VoidCallback onPressed;

  const HeaderButton({
    Key? key,
    required this.titleText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitleText(context),
          Padding(
            padding: EdgeInsets.zero,
            child: buildElevatedButtonRight(context),
          )
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButtonRight(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: () {
        onPressed();
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            LocaleKeys.home_game_viewAll,
            style: context.general.textTheme.titleSmall
                ?.copyWith(color: context.general.colorScheme.onError),
          ),
          Icon(Icons.arrow_right, color: context.general.colorScheme.onError),
        ],
      ),
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      titleText.locale,
      style: context.general.textTheme.titleLarge
          ?.copyWith(color: context.general.colorScheme.onError),
    );
  }
}
