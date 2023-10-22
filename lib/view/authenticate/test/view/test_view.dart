import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/cache/locale_manage.dart';
import '../../../../core/init/localization/locale_keys.g.dart';
import '../../../../core/init/localization/localization_manager.dart';
import '../viewmodel/test_view_model.dart';

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
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber(),
      );

  Widget textNumber() => Column(
        children: [
          mailField,
          Observer(builder: (context) {
            return Text(viewModel.number.toString());
          }),
          ListView(
            children: [
              Container(
                height: context.height * 0.4,
                color: context.colors.background,
                child: buildText(),
              ),
              Padding(
                padding: context.paddinMedium,
                child: Placeholder(),
              )
            ],
          )
        ],
      );

  Text buildText() {
    return Text(
      "hello",
      style: context.textTheme.labelSmall,
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      actions: [iconbuttonChangeTheme()],
    );
  }

  IconButton iconbuttonChangeTheme() {
    return IconButton(
        onPressed: () {
          context.setLocale(LocalizationManager.instance.enLocale);
        },
        icon: Icon(Icons.change_history_outlined));
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  FloatingActionButton get floatingActionButtonNumberIncrement =>
      FloatingActionButton(
        onPressed: () {
          viewModel.increment();
        },
        child: const Icon(Icons.add),
      );
}

extension _FormArea on _TestViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) =>
            value!.contains(RegExp(r"[a-zA-Z]")) ? null : "Email not valid",
      );
}
