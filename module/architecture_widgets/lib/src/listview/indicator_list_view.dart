// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(6),
      child: buildCircleAvatar(index, context),
    );
  }

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      radius: currentIndex == index
          ? MediaQuery.of(context).size.width * 0.03
          : MediaQuery.of(context).size.width * 0.015,
      child: AnimatedOpacity(
        opacity: currentIndex == index ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: onListItem(index),
      ),
    );
  }
}
