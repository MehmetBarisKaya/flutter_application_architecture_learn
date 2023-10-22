import '../../../_product/_utility/service_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/game_enums.dart';
import '../model/game_model.dart';
import '../model/slider_model.dart';
import 'IGameService.dart';

import 'package:vexana/vexana.dart';

class GameService extends IGameService with ServiceHelper {
  GameService(super.manager, super.scaffoldyKey);

  @override
  Future<List<GameModel>?> fetchGameItems(GameEnum type) async {
    final response = await manager.send<GameModel, List<GameModel>>(
        NetworkRoutes.GAME.rawValue,
        urlSuffix: "/${type.index + 1}",
        parseModel: GameModel(),
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<List<SliderModel>?> fetchSliderItems() async {
    final response = await manager.send<SliderModel, List<SliderModel>>(
        NetworkRoutes.SLIDER.rawValue,
        parseModel: SliderModel(),
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}
