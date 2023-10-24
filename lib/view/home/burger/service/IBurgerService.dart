import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/model/burger_model.dart';
import 'package:vexana/vexana.dart';

abstract class IBurgerService {
  final INetworkManager networkManager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  IBurgerService(this.networkManager, this.scaffoldKey);

  Future<List<BurgerModel>?> fetchFavoriteBurger();
  Future<List<BurgerModel>?> fetchBurgerLimited(
      {double? max = 50, double? min = 0});
  Future<List<BurgerModel>?> fetchBurgerSorted(
      {required BurgerNetworkEnum networkEnum,
      BurgerNetworkEnumType type = BurgerNetworkEnumType.ASC});
}
