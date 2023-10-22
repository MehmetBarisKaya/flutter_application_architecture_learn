// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_enums.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/slider_model.dart';
import 'package:vexana/vexana.dart';

abstract class IGameService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldyKey;
  IGameService(
    this.manager,
    this.scaffoldyKey,
  );

  Future<List<SliderModel>?> fetchSliderItems();
  Future<List<GameModel>?> fetchGameItems(GameEnum type);
}
