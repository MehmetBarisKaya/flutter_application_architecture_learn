// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:kartal/kartal.dart';

class GameSlider extends StatefulWidget {
  final List<SliderModel>? sliderModel;
  const GameSlider({
    Key? key,
    this.sliderModel,
  }) : super(key: key);

  @override
  State<GameSlider> createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {
  int _selectedValueIndex = 0;

  void _changeValue(int index) {
    _selectedValueIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: buildPageView(),
        ),
        Expanded(child: buildListViewCircleIndicator())
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.95),
      itemCount: widget.sliderModel?.length ?? 0,
      onPageChanged: _changeValue,
      itemBuilder: (context, index) => buildCardImage(index),
    );
  }

  Widget buildCardImage(int index) {
    return CachedNetworkImage(
      imageUrl: widget.sliderModel?[index].image ?? "",
    );
  }

  ListView buildListViewCircleIndicator() {
    return ListView.builder(
      itemCount: widget.sliderModel?.length ?? 0,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(context.sized.dynamicWidth(0.01)),
        child: CircleAvatar(
          radius: 10,
          backgroundColor: _selectedValueIndex == index
              ? context.general.colorScheme.onError
              : context.general.colorScheme.onError.withOpacity(0.1),
        ),
      ),
    );
  }
}
