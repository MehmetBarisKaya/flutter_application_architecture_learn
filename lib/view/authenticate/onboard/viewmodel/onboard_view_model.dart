import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constant.dart';
import '../../../../core/init/localization/locale_keys.g.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/onboard_model.dart';

part 'onboard_view_model.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store, BaseViewModel {
  List<OnboardModel> onBoardItems = [];

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) {
    viewModelContext = context;
  }

  @override
  void init() {
    onBoardItems = [
      OnboardModel(
        LocaleKeys.onBoard_page1_title,
        LocaleKeys.onBoard_page1_desc,
        SVGImagePath.instance.astronautSVG,
      ),
      OnboardModel(
        LocaleKeys.onBoard_page2_title,
        LocaleKeys.onBoard_page2_desc,
        SVGImagePath.instance.chattingSVG,
      ),
      OnboardModel(
        LocaleKeys.onBoard_page3_title,
        LocaleKeys.onBoard_page3_desc,
        SVGImagePath.instance.relaxSVG,
      ),
    ];
  }

  @observable
  int currentPageIndex = 0;

  @action
  void onPageChanged(int value) {
    currentPageIndex = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager?.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);

    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      navigation.navigateToPageClear(path: NavigationConstant.TEST_VIEW);
    }
  }
}
