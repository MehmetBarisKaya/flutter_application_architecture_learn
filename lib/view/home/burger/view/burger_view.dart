import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/slider/range_price_slider.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/product/widget/card/burger_card.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/burger_network_enum.dart';
import 'package:fluttermvvmtemplate/view/home/burger/service/burger_service.dart';
import 'package:fluttermvvmtemplate/view/home/burger/viewmodel/burger_view_model.dart';
import 'package:kartal/kartal.dart';

enum _BurgerViews {
  BEST_SELL_TITLE,
  BURGER_FAVORITES,
  NORMAL_TITLE,
  BURGER_VIEW,
}

class BurgerView extends StatelessWidget {
  const BurgerView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();
    return BaseView<BurgerViewModel>(
      viewModel: BurgerViewModel(
          BurgerService(VexanaManager.instance.networkManager, scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BurgerViewModel viewModel) =>
          Scaffold(
        appBar: buildAppBar(context, viewModel),
        body: Padding(
          padding: context.padding.low,
          child: Observer(builder: (_) {
            return viewModel.isLoading
                ? Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : ListView.builder(
                    itemCount: _BurgerViews.values.length,
                    itemBuilder: (context, index) {
                      final _views = _BurgerViews.values[index];
                      switch (_views) {
                        case _BurgerViews.BEST_SELL_TITLE:
                          return buildTextBestSelling(context);

                        case _BurgerViews.BURGER_FAVORITES:
                          return buildSizedBoxFavorite(context, viewModel);

                        case _BurgerViews.NORMAL_TITLE:
                          return buildnormalTitle(context);
                        case _BurgerViews.BURGER_VIEW:
                          viewModel.fetchSortedItems();
                          return buildNormalburgers(viewModel);
                      }
                    },
                  );
          }),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, BurgerViewModel viewModel) {
    return AppBar(
      leading: Icon(Icons.food_bank_outlined),
      actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => buildBottomSheetBody(context, viewModel),
              );
            },
            icon: Icon(Icons.filter_alt)),
      ],
    );
  }

  Widget buildBottomSheetBody(
          BuildContext context, BurgerViewModel viewModel) =>
      Padding(
        padding: context.padding.low,
        child: Column(
          children: [
            Text("Filter"),
            Divider(
              height: 2,
              thickness: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: RangePriceSlider(
                    min: 10,
                    max: 50,
                    onCompleted: (values) {
                      viewModel.changeRangeValues(values);
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      viewModel.fetchMinMax();
                    },
                    icon: Icon(Icons.check_box_outline_blank)),
              ],
            ),
            Card(
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    children: BurgerNetworkEnum.values
                        .map((e) => IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              viewModel.fetchSort(e);
                            },
                            icon: Text(
                              e.rawValue,
                              maxLines: 1,
                            )))
                        .toList(),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => viewModel.changeAscending(true),
                          icon: Icon(Icons.plus_one)),
                      IconButton(
                          onPressed: () => viewModel.changeAscending(false),
                          icon: Icon(Icons.repeat_one_rounded)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Text buildnormalTitle(BuildContext context) {
    return Text(
      LocaleKeys.home_burgers_normalProducts.locale,
      style: context.general.textTheme.displaySmall?.copyWith(
          color: context.general.colorScheme.onSecondary,
          fontWeight: FontWeight.bold),
    );
  }

  Observer buildNormalburgers(BurgerViewModel viewModel) {
    return Observer(builder: (_) {
      return viewModel.isLoadingMain
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: viewModel.mainBurgers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BurgerCard(
                  model: viewModel.mainBurgers[index],
                );
              },
            );
    });
  }

  SizedBox buildSizedBoxFavorite(
      BuildContext context, BurgerViewModel viewModel) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.3),
      child: BurgerCard().buildList(viewModel.favoriteBurgers),
    );
  }

  Text buildTextBestSelling(BuildContext context) {
    return Text(
      LocaleKeys.home_burgers_favoriteProducts.locale,
      style: context.general.textTheme.displaySmall?.copyWith(
          color: context.general.colorScheme.onSecondary,
          fontWeight: FontWeight.bold),
    );
  }
}
