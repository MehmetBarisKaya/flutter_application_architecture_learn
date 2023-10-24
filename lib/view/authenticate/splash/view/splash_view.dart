import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/base/view/base_widget.dart';
import 'package:fluttermvvmtemplate/core/constants/image/image_constant.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';
import 'package:fluttermvvmtemplate/core/init/localization/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/view/authenticate/splash/viewmodel/splash_view_model.dart';
import 'package:kartal/kartal.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          buildScaffoldBody(context, viewModel),
    );
  }

  Scaffold buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    var _backgroundColor = Colors.purple[300];
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            buildCentextTextWelcome(context, viewModel),
            buildAnimatedAlignIcon(viewModel, context),
          ],
        ),
      ),
    );
  }

  Widget buildCentextTextWelcome(
      BuildContext context, SplashViewModel viewModel) {
    return Center(child: Observer(builder: (_) {
      return AnimatedOpacity(
        duration: context.duration.durationNormal,
        opacity: viewModel.isFirstInit ? 0 : 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.splash_welcome.locale,
              style: context.general.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    }));
  }

  Widget buildAnimatedAlignIcon(
      SplashViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedAlign(
          alignment:
              viewModel.isFirstInit ? Alignment.center : Alignment.bottomCenter,
          duration: context.duration.durationLow,
          child: Image.asset(ImageConstants.instance.projeIcon));
    });
  }
}
