import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/enums/app_theme_enum.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/extension/widget_extension.dart';
import '../../../core/init/localization/locale_keys.g.dart';
import '../../../core/init/localization/localization_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/enum/lottie_path_enum.dart';
import '../viewmodel/setting_view_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return BaseView<SettingsViewModel>(
      viewModel: SettingsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SettingsViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.padding.low,
          child: CustomScrollView(
            key: key,
            slivers: [
              buildSliverAppBar(context),
              buildCardUser(context, viewModel).toSliver,
              context.sized.emptySizedHeightBoxLow.toSliver,
              buildCardHeaderProjectCore(context, viewModel).toSliver,
              buildCardApplicationTour(viewModel).toSliver,
              context.sized.emptySizedHeightBoxLow.toSliver,
              buildCardAbout(context, viewModel).toSliver,
              context.sized.emptySizedHeightBoxNormal.toSliver,
              Text(
                "${"".ext.version}",
                textAlign: TextAlign.center,
                style: context.general.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w100),
              ).toSliver,
              context.sized.emptySizedHeightBoxNormal.toSliver,
              buildTextButtonLogout(context, viewModel).toSliver,
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardApplicationTour(SettingsViewModel viewModel) {
    return Card(
      child: ListTile(
        onTap: viewModel.navigateToOnBoard,
        title: Text(LocaleKeys.home_setting_applicationTour.locale),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  TextButton buildTextButtonLogout(
      BuildContext context, SettingsViewModel viewModel) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          shape: StadiumBorder(),
          padding: context.padding.normal,
          backgroundColor:
              context.general.colorScheme.onError.withOpacity(0.7)),
      onPressed: viewModel.logoutApp,
      icon: Icon(Icons.exit_to_app),
      label: Text(LocaleKeys.home_setting_exit.locale),
    );
  }

  Widget buildCardHeaderProjectCore(
      BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        title: LocaleKeys.home_setting_core_title.locale,
        children: [
          ListTile(
            leading: Icon(Icons.draw_outlined),
            title: Text(LocaleKeys.home_setting_core_themeTitle.locale),
            subtitle: Text(LocaleKeys.home_setting_core_themeDesc.locale),
            trailing: IconButton(
                onPressed: () {
                  viewModel.changeAppTheme();
                },
                icon: context.read<ThemeNotifier>().currentThemeEnum ==
                        AppThemes.LIGHT
                    ? LottiePathEnum.MOON.toWidget
                    : LottiePathEnum.SUNNY.toWidget),
          ),
          ListTile(
            leading: Icon(Icons.draw_outlined),
            title: Text(LocaleKeys.home_setting_core_langTitle.locale),
            subtitle: Text(LocaleKeys.home_setting_core_langDesc.locale),
            trailing: Observer(builder: (_) {
              return DropdownButton<Locale>(
                items: [
                  DropdownMenuItem(
                    child: Text(LocalizationManager
                        .instance.trLocale.countryCode!
                        .toUpperCase()),
                    value: LocalizationManager.instance.trLocale,
                  ),
                  DropdownMenuItem(
                    child: Text(LocalizationManager
                        .instance.enLocale.countryCode!
                        .toUpperCase()),
                    value: LocalizationManager.instance.enLocale,
                  ),
                ],
                onChanged: viewModel.changeAppLocalization,
                value: viewModel.appLocale,
              );
            }),
          ),
        ]);
  }

  Widget buildCardHeader(BuildContext context, SettingsViewModel viewModel,
      {required String title, required List<Widget> children}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: context.padding.low,
            child: Text(title, style: context.general.textTheme.headlineSmall),
          ),
          Divider(),
          ...children,
        ],
      ),
    );
  }

  Widget buildCardAbout(BuildContext context, SettingsViewModel viewModel) {
    return buildCardHeader(context, viewModel,
        title: LocaleKeys.home_setting_about_title.locale,
        children: [
          ListTile(
            onTap: viewModel.navigateToContribution,
            leading: Icon(Icons.favorite),
            title: Text(LocaleKeys.home_setting_about_contribitions.locale),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          ListTile(
            onTap: viewModel.navigateToFakeContribution,
            leading: Icon(Icons.home),
            title: Text(LocaleKeys.home_setting_applicationTour.locale),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ]);
  }

  Card buildCardUser(BuildContext context, SettingsViewModel viewModel) {
    return Card(
      child: SizedBox(
        height: context.sized.dynamicHeight(0.1),
        child: Padding(
          padding: context.padding.low,
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Text(viewModel.userModel.shortName),
              ),
              Spacer(),
              Text(viewModel.userModel.fullName),
              Spacer(
                flex: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [buildSliverAppBar(context)];
        },
        body: Text("data"));
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      pinned: true,
      elevation: 0,
      backgroundColor: context.general.colorScheme.background,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(LocaleKeys.home_setting_title.locale,
            style: context.general.textTheme.headlineSmall),
      ),
    );
  }
}
