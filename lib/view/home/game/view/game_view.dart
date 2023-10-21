import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/product/widget/button/header_button.dart';
import 'package:fluttermvvmtemplate/product/widget/grid/game_grid_view.dart';
import 'package:fluttermvvmtemplate/product/widget/pageview/game_slider.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_view_state.dart';
import 'package:fluttermvvmtemplate/view/home/game/service/game_service.dart';
import 'package:fluttermvvmtemplate/view/home/game/viewmodel/game_view_model.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

part './subview/game_view_cards.dart';

class GameView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(
          GameService(VexanaManager.instance.networkManager, _scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GameViewModel viewModel) =>
          Scaffold(
              key: _scaffoldKey,
              appBar: buildAppBar(context),
              body: Observer(builder: (_) {
                return viewModel.isLoading
                    ? CircularProgressIndicator()
                    : DefaultTabController(
                        length: viewModel.gameTabItems.length,
                        child: ListView.builder(
                          itemCount: GameViewItems.values.length,
                          itemBuilder: (context, index) {
                            switch (GameViewItems.values[index]) {
                              case GameViewItems.SEARCH_BAR:
                                return buildPaddingSearchBar(context);

                              case GameViewItems.TABBAR:
                                return buildTabBar(context, viewModel);
                              case GameViewItems.SLIDER:
                                return buildSizedBoxSlider(context, viewModel);
                              case GameViewItems.NEW_UPDATE_GAMES_CARD:
                                return buildColumnNewCard(viewModel);
                              case GameViewItems.TOP_UPDATE_GAMES_CARD:
                                return buildColumnUpdateCard(viewModel);
                              default:
                                throw Exception("State not found: ");
                            }
                          },
                        ),
                      );
              })),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.rounded_corner),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.camera_enhance))],
      title: Text(LocaleKeys.home_game_title.locale,
          style: context.general.textTheme.headlineSmall?.copyWith(
              color: context.general.colorScheme.onError,
              fontWeight: FontWeight.bold)),
    );
  }

  TabBar buildTabBar(BuildContext context, GameViewModel viewModel) {
    return TabBar(
        indicatorColor: context.general.colorScheme.onError,
        labelPadding: EdgeInsets.zero,
        indicatorWeight: 3,
        isScrollable: true,
        tabs: viewModel.gameTabItems
            .map((e) => Tab(
                  child: Padding(
                    padding: context.padding.low,
                    child: Text(e),
                  ),
                ))
            .toList());
  }

  Widget buildSizedBoxSlider(BuildContext context, GameViewModel viewModel) {
    return Padding(
      padding: context.padding.verticalLow,
      child: SizedBox(
        height: context.sized.dynamicHeight(0.3),
        child: GameSlider(
          sliderModel: viewModel.sliderItems,
        ),
      ),
    );
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
