part of '../setting_view_model.dart';

extension SettingsViewModelBaseNavigate on _SettingsViewModelBase {
  void navigateToContribution() {
    navigation.navigateToPage(
        path: NavigationConstant.SETTINGS_WEB_VIEW,
        object: SettingsWebModel.fakeArchitecturePR());
  }

  void navigateToFakeContribution() {
    navigation.navigateToPage(
        path: NavigationConstant.SETTINGS_WEB_VIEW,
        object: SettingsWebModel.fakeNull());
  }
}
