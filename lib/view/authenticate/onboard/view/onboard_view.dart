import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/components/column/form_column.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/_widgets/listview/onboard_indicator.dart';
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
        onPageBuilder: (BuildContext context, OnboardViewModel value) => Column(
              children: [
                Expanded(flex: 9, child: buildPageView()),
                Expanded(child: buildObserverIndicator()),
              ],
            ));
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        _viewModel.onPageChanged(value);
      },
      itemCount: _viewModel.onBoardModel.length,
      itemBuilder: (context, index) => Container(
        color: context.randomColor,
        child: FormColumn(
          children: [Placeholder(), Text(_viewModel.onBoardModel[index].text)],
        ),
      ),
    );
  }

  Observer buildObserverIndicator() {
    return Observer(builder: (_) {
      return OnBoardIndicator(
          itemCount: _viewModel.onBoardModel.length,
          currentIndex: _viewModel.currentPageIndex);
    });
  }
}
