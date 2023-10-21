// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {
  final GameModel model;
  final VoidCallback onPressed;
  const GameCard({
    Key? key,
    required this.model,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.padding.low,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Center(
              child: Image.network(model.image ?? ""),
            )),
            Text(model.name ?? ""),
            Text("\$ ${model.money}"),
          ],
        ),
      ),
    );
  }
}
