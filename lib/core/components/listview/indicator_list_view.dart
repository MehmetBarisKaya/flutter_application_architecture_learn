// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  const IndicatorListView({
    Key? key,
    required this.onListItem,
    required this.itemCount,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int index) onListItem;
  final int itemCount;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => buildPadding(context, index),
    );
  }

  Padding buildPadding(BuildContext context, int index) {
    return Padding(
      padding: context.paddingLow,
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      radius:
          currentIndex == index ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: currentIndex == index ? 1 : 0,
        duration: context.durationLow,
        child: onListItem(index),
      ),
    );
  }
}
