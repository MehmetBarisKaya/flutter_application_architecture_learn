import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/state/base_state.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/preferences_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/cache/locale_manage.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/core/init/localization/localization_manager.dart';
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
        appBar: AppBar(
          title: Text(
              LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
          actions: [iconbuttonChangeTheme()],
        ),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber(),
      );

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconbuttonChangeTheme() {
    return IconButton(
        onPressed: () {
          context.setLocale(LocalizationManager.instance.enLocale);
        },
        icon: Icon(Icons.change_history_outlined));
  }

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
