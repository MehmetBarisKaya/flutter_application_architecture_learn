enum BurgerNetworkEnum { NAME, PRICE, RATES, UPDATED }

enum BurgerNetworkEnumType { ASC, DSC }

enum BurgerNetworkPath { MAIN, PRICE }

enum BurgerQueryParamaters { FAVORITE, SORT, SORT_TYPE, MIN, MAX }

extension BurgerNetworkEnumExtension on BurgerNetworkEnum {
  String get rawValue {
    switch (this) {
      case BurgerNetworkEnum.NAME:
        return "name";
      case BurgerNetworkEnum.PRICE:
        return "price";
      case BurgerNetworkEnum.RATES:
        return "rates";
      case BurgerNetworkEnum.UPDATED:
        return "updated";
    }
  }
}

extension BurgerNetworkEnumTypeExtension on BurgerNetworkEnumType {
  int get rawValue {
    switch (this) {
      case BurgerNetworkEnumType.ASC:
        return -1;

      case BurgerNetworkEnumType.DSC:
        return 1;
    }
  }
}

extension BurgerNetworkPathExtension on BurgerNetworkPath {
  String get rawValue {
    switch (this) {
      case BurgerNetworkPath.MAIN:
        return 'burgers';
      case BurgerNetworkPath.PRICE:
        return 'burgers/price';
    }
  }
}

extension BurgerQueryParamatersExtension on BurgerQueryParamaters {
  MapEntry<String, dynamic> rawValue(dynamic value) {
    switch (this) {
      case BurgerQueryParamaters.FAVORITE:
        return MapEntry('isFavorite', value);
      case BurgerQueryParamaters.SORT:
        return MapEntry('sort', value);
      case BurgerQueryParamaters.SORT_TYPE:
        return MapEntry('sortType', value);
      case BurgerQueryParamaters.MIN:
        return MapEntry('min', value);
      case BurgerQueryParamaters.MAX:
        return MapEntry('max', value);
    }
  }
}
