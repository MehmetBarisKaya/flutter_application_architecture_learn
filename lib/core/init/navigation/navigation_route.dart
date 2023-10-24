import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/view/splash_view.dart';

import '../../../product/exception/navigate_model_not_found.dart';
import '../../../view/authenticate/onboard/view/onboard_view.dart';
import '../../../view/authenticate/test/view/test_view.dart';
import '../../../view/settings/service/setting_web_view.dart';
import '../../../view/settings/view/subview/setting_web_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constant.dart';

class NavigationRoute {
  NavigationRoute._init();
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  Route<dynamic>? generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.DEAFULT:
        return normalNavigate(SplashView());
      case NavigationConstant.TEST_VIEW:
        return normalNavigate(TestView());
      case NavigationConstant.SETTINGS_WEB_VIEW:
        if (args.arguments is SettingsWebModel) {
          return normalNavigate(SettingsWebView(
            model: args.arguments as SettingsWebModel,
          ));
        }
        throw NavigateException<SettingsWebModel>(args.arguments);
      case NavigationConstant.ON_BOARD:
        return normalNavigate(OnBoardView());
      default:
    }
    return MaterialPageRoute(
      builder: (context) => NotFoundNavigationWidget(),
    );
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
