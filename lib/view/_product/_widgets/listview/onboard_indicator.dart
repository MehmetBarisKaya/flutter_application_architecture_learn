// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/listview/indicator_list_view.dart';

class OnBoardIndicator extends StatelessWidget {
  const OnBoardIndicator({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
  }) : super(key: key);
  final int itemCount;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return IndicatorListView(
        currentIndex: currentIndex,
        onListItem: (index) {
          return FlutterLogo();
        },
        itemCount: itemCount);
  }
}
