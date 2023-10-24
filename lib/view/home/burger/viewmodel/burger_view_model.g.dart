// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BurgerViewModel on _BurgerViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_BurgerViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isLoadingMainAtom =
      Atom(name: '_BurgerViewModelBase.isLoadingMain', context: context);

  @override
  bool get isLoadingMain {
    _$isLoadingMainAtom.reportRead();
    return super.isLoadingMain;
  }

  @override
  set isLoadingMain(bool value) {
    _$isLoadingMainAtom.reportWrite(value, super.isLoadingMain, () {
      super.isLoadingMain = value;
    });
  }

  late final _$favoriteBurgersAtom =
      Atom(name: '_BurgerViewModelBase.favoriteBurgers', context: context);

  @override
  List<BurgerModel> get favoriteBurgers {
    _$favoriteBurgersAtom.reportRead();
    return super.favoriteBurgers;
  }

  @override
  set favoriteBurgers(List<BurgerModel> value) {
    _$favoriteBurgersAtom.reportWrite(value, super.favoriteBurgers, () {
      super.favoriteBurgers = value;
    });
  }

  late final _$mainBurgersAtom =
      Atom(name: '_BurgerViewModelBase.mainBurgers', context: context);

  @override
  List<BurgerModel> get mainBurgers {
    _$mainBurgersAtom.reportRead();
    return super.mainBurgers;
  }

  @override
  set mainBurgers(List<BurgerModel> value) {
    _$mainBurgersAtom.reportWrite(value, super.mainBurgers, () {
      super.mainBurgers = value;
    });
  }

  late final _$fetchFavoriteAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchFavorite', context: context);

  @override
  Future<void> fetchFavorite() {
    return _$fetchFavoriteAsyncAction.run(() => super.fetchFavorite());
  }

  late final _$fetchSortedItemsAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchSortedItems', context: context);

  @override
  Future<void> fetchSortedItems() {
    return _$fetchSortedItemsAsyncAction.run(() => super.fetchSortedItems());
  }

  late final _$fetchMinMaxAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchMinMax', context: context);

  @override
  Future<void> fetchMinMax() {
    return _$fetchMinMaxAsyncAction.run(() => super.fetchMinMax());
  }

  late final _$fetchSortAsyncAction =
      AsyncAction('_BurgerViewModelBase.fetchSort', context: context);

  @override
  Future<void> fetchSort(BurgerNetworkEnum value) {
    return _$fetchSortAsyncAction.run(() => super.fetchSort(value));
  }

  late final _$_BurgerViewModelBaseActionController =
      ActionController(name: '_BurgerViewModelBase', context: context);

  @override
  void _changeLoading() {
    final _$actionInfo = _$_BurgerViewModelBaseActionController.startAction(
        name: '_BurgerViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_BurgerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingMain() {
    final _$actionInfo = _$_BurgerViewModelBaseActionController.startAction(
        name: '_BurgerViewModelBase._changeLoadingMain');
    try {
      return super._changeLoadingMain();
    } finally {
      _$_BurgerViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingMain: ${isLoadingMain},
favoriteBurgers: ${favoriteBurgers},
mainBurgers: ${mainBurgers}
    ''';
  }
}
