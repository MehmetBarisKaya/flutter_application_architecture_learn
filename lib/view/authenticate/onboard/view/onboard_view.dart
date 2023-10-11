import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/avatar/onboard_circle.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/onboard_model.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/viewmodel/onboard_view_model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  // ignore: unused_field
  late OnboardViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnboardViewModel>(
        viewModel: OnboardViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          _viewModel = model;
        },
        onPageBuilder: (BuildContext context, OnboardViewModel value) =>
            Scaffold(
              body: Padding(
                padding: context.paddingNormalHorizontal,
                child: Column(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 5,
                      child: buildPageView(),
                    ),
                    Expanded(flex: 2, child: buildRowFooter(context)),
                  ],
                ),
              ),
            ));
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        _viewModel.onPageChanged(value);
      },
      itemCount: _viewModel.onBoardItems.length,
      itemBuilder: (context, index) => buildCoumnBody(
        context,
        _viewModel.onBoardItems[index],
      ),
    );
  }

  Row buildRowFooter(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        flex: 2,
        child: ListView.builder(
            itemCount: _viewModel.onBoardItems.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Observer(builder: (context) {
                  return OnBoardCircle(
                      isSelected: _viewModel.currentPageIndex == index);
                })),
      ),
      Spacer(),
      buildFloatingActionButtonSkip(context)
    ]);
  }

  FloatingActionButton buildFloatingActionButtonSkip(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.colors.secondary,
      onPressed: () => _viewModel.completeToOnBoard(),
      child: Observer(
        builder: (context) => _viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : Icon(
                Icons.keyboard_arrow_right,
                color: context.colors.background,
              ),
      ),
    );
  }

  Column buildCoumnBody(BuildContext context, OnboardModel model) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: buildSvgPicture(model.imagePath),
        ),
        Expanded(flex: 3, child: buildColumDescription(context, model)),
      ],
    );
  }

  Column buildColumDescription(BuildContext context, OnboardModel model) {
    return Column(children: [
      buildAutoLocaleTextTitle(model, context),
      Padding(
        padding: context.paddingMediumHorizontal,
        child: buildAutoLocaleTextDescription(model, context),
      ),
    ]);
  }

  AutoLocaleText buildAutoLocaleTextTitle(
      OnboardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: context.textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold, color: context.colors.primary),
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(
      OnboardModel model, BuildContext context) {
    return AutoLocaleText(
        value: model.description,
        style: context.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.w100));
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);

  // PageView buildPageView() {
  //   return PageView.builder(
  //     onPageChanged: (value) {
  //       _viewModel.onPageChanged(value);
  //     },
  //     itemCount: _viewModel.onBoardModel.length,
  //     itemBuilder: (context, index) => Container(
  //       color: context.randomColor,
  //       child: FormColumn(
  //         children: [Placeholder(), Text(_viewModel.onBoardModel[index].text)],
  //       ),
  //     ),
  //   );
  // }

  // Observer buildObserverIndicator() {
  //   return Observer(builder: (_) {
  //     return OnBoardIndicator(
  //         itemCount: _viewModel.onBoardModel.length,
  //         currentIndex: _viewModel.currentPageIndex);
  //   });
  // }
}
