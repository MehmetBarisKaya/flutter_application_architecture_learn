import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/state/base_state.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel viewModel = TestViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, model) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber(),
      );

  Widget textNumber() => Observer(builder: (context) {
        return Text(viewModel.number.toString());
      });

  FloatingActionButton get floatingActionButtonNumberIncrement =>
      FloatingActionButton(
        onPressed: () {
          viewModel.increment();
        },
        child: const Icon(Icons.add),
      );
}
