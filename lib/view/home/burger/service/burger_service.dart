import 'package:fluttermvvmtemplate/view/_product/_mixin/network_helper.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/model/burger_model.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/IBurgerService.dart';
import 'package:vexana/vexana.dart';

class BurgerService extends IBurgerService with NetworkHelper {
  BurgerService(super.networkManager, super.scaffoldKey);

  @override
  Future<List<BurgerModel>?> fetchBurgerLimited(
      {double? max = 50, double? min = 0}) async {
    final response = await networkManager.send<BurgerModel, List<BurgerModel>>(
        BurgerNetworkPath.PRICE.rawValue,
        parseModel: BurgerModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([
          BurgerQueryParamaters.MIN.rawValue(min),
          BurgerQueryParamaters.MAX.rawValue(max)
        ]));
    return response.data ?? [];
  }

  @override
  Future<List<BurgerModel>?> fetchBurgerSorted(
      {required BurgerNetworkEnum networkEnum,
      BurgerNetworkEnumType type = BurgerNetworkEnumType.ASC}) async {
    final response = await networkManager.send<BurgerModel, List<BurgerModel>>(
        BurgerNetworkPath.MAIN.rawValue,
        parseModel: BurgerModel(),
        method: RequestType.GET,
        queryParameters: Map.fromEntries([
          BurgerQueryParamaters.SORT.rawValue(networkEnum.rawValue),
          BurgerQueryParamaters.SORT_TYPE.rawValue(type.rawValue)
        ]));
    return response.data ?? [];
  }

  @override
  Future<List<BurgerModel>?> fetchFavoriteBurger() async {
    final response = await networkManager.send<BurgerModel, List<BurgerModel>>(
        BurgerNetworkPath.MAIN.rawValue,
        parseModel: BurgerModel(),
        method: RequestType.GET,
        queryParameters:
            Map.fromEntries([BurgerQueryParamaters.FAVORITE.rawValue(true)]));
    //showLog(response);
    return response.data ?? [];
  }
}
