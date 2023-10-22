import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constant.dart';
import '../../../core/init/localization/localization_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../../../product/model/user_model.dart';
import '../service/setting_web_view.dart';

part './subviewmodel/about_view_model.dart';
part 'setting_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();
  void setContext(BuildContext context) => viewModelContext = context;
  @observable
  Locale appLocale = LocalizationManager.instance.enLocale;
  void init() {}

  void changeAppTheme() {
    viewModelContext.read<ThemeNotifier>().changeTheme();
  }

  @action
  void changeAppLocalization(Locale? locale) {
    if (locale != null) {
      appLocale = locale;
      viewModelContext.setLocale(locale);
    }
  }

  Future<void> logoutApp() async {
    await localeManager!.clearAllSaveFirst();
    await navigation.navigateToPageClear(path: NavigationConstant.TEST_VIEW);
  }

  Future<void> navigateToOnBoard() async {
    await localeManager!.clearAllSaveFirst();
    await navigation.navigateToPage(path: NavigationConstant.ON_BOARD);
  }
}
