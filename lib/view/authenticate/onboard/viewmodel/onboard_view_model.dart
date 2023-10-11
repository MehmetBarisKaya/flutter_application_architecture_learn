import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/preferences_keys_enum.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_constant.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/_product/_constants/image_path_svg.dart';
import 'package:fluttermvvmtemplate/view/authenticate/onboard/model/onboard_model.dart';
import 'package:mobx/mobx.dart';
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

    navigation.navigateToPageClear(path: NavigationConstant.TEST_VIEW);
  }
}
