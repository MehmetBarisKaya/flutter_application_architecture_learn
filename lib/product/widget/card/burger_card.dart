// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:fluttermvvmtemplate/view/home/burger/model/burger_model.dart';

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    Key? key,
    this.model,
  }) : super(key: key);
  final BurgerModel? model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(imageUrl: model?.image ?? ""),
          ),
          Text(model?.name ?? ""),
          RatingBar.builder(
            initialRating: model?.rates ?? 0,
            ignoreGestures: true,
            itemSize: 12,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.discord,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text("${model?.price.toString()} \$"),
        ],
      ),
    );
  }
}

extension BurgerCardExtension on BurgerCard {
  Widget buildList(List<BurgerModel> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items
            .map((e) => BurgerCard(
                  model: e,
                ))
            .toList(),
      ),
    );
  }
}
