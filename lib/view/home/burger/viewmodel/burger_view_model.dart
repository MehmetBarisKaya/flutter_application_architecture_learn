import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/model/burger_model.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/IBurgerService.dart';
import 'package:kartal/kartal.dart';
import 'package:mobx/mobx.dart';
part 'burger_view_model.g.dart';

class BurgerViewModel = _BurgerViewModelBase with _$BurgerViewModel;

abstract class _BurgerViewModelBase with Store, BaseViewModel {
  final IBurgerService burgerService;
  _BurgerViewModelBase(this.burgerService);

  @observable
  bool isLoading = false;
  @observable
  bool isLoadingMain = false;
  @observable
  List<BurgerModel> favoriteBurgers = [];
  @observable
  List<BurgerModel> mainBurgers = [];

  RangeValues? _values;
  bool isAscending = true;

  void setContext(BuildContext context) => viewModelContext = context;
  void init() {
    fetchFavorite();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingMain() {
    isLoadingMain = !isLoadingMain;
  }

  @action
  Future<void> fetchFavorite() async {
    _changeLoading();
    final response = await burgerService.fetchFavoriteBurger();
    favoriteBurgers = response ?? [];
    _changeLoading();
  }

  @action
  Future<void> fetchSortedItems() async {
    if (mainBurgers.isNotEmpty) return;
    _changeLoadingMain();
    final response = await burgerService.fetchBurgerSorted(
        networkEnum: BurgerNetworkEnum.RATES);
    mainBurgers = response ?? [];
    _changeLoadingMain();
  }

  void changeRangeValues(RangeValues values) {
    _values = values;
  }

  void changeAscending(bool value) {
    isAscending = value;
  }

  @action
  Future<void> fetchMinMax() async {
    viewModelContext.route.navigation.pop();
    _changeLoadingMain();
    final response = await burgerService.fetchBurgerLimited(
        min: _values?.start, max: _values?.end);
    mainBurgers = response ?? [];
    _changeLoadingMain();
  }

  @action
  Future<void> fetchSort(BurgerNetworkEnum value) async {
    viewModelContext.route.navigation.pop();
    _changeLoadingMain();
    final response = await burgerService.fetchBurgerSorted(
        networkEnum: value,
        type: isAscending
            ? BurgerNetworkEnumType.ASC
            : BurgerNetworkEnumType.DSC);
    mainBurgers = response ?? [];
    _changeLoadingMain();
  }
}
