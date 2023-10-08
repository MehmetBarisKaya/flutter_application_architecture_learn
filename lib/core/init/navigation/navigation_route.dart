import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/card/not_found_navigation_widget.dart';
import 'package:fluttermvvmtemplate/core/constants/navigation/navigation_constant.dart';
import 'package:fluttermvvmtemplate/view/authenticate/test/view/test_view.dart';

class NavigationRoute {
  NavigationRoute._init();
  static NavigationRoute? _instance;
  static NavigationRoute get instance {
    _instance ??= NavigationRoute._init();
    return _instance!;
  }

  Route<dynamic>? generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.TEST_VIEW:
        return normalNavigate(TestView());

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
