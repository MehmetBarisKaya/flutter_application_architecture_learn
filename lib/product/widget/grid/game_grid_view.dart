// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/product/widget/card/game_card.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';

class GameGrid extends StatelessWidget {
  final List<GameModel> gameModels;
  final void Function(GameModel item, int index) onSelected;
  const GameGrid({
    Key? key,
    required this.gameModels,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => GameCard(
              model: gameModels[index],
              onPressed: () {
                onSelected(gameModels[index], index);
              },
            ));
  }
}
