import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/IBurgerService.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/burger_service.dart';

void main() {
  late IBurgerService burgerService;

  setUp(() {
    burgerService = BurgerService(VexanaManager.instance.networkManager, null);
  });
  test('Fetch Favorite Burgers', () async {
    final response = await burgerService.fetchFavoriteBurger();
    expect(response, isNotEmpty);
  });

  test('Fetch min 20 max 30 service', () async {
    final response = await burgerService.fetchBurgerLimited(min: 20, max: 30);
    expect(response, isNotEmpty);
  });
  test('Fetch sort rate', () async {
    final response = await burgerService.fetchBurgerSorted(
        networkEnum: BurgerNetworkEnum.RATES);
    expect(response, isNotEmpty);
  });
}
