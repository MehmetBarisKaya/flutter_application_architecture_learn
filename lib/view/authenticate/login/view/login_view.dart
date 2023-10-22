import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/image/image_constant.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/localization/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
          //_viewModel = model;
        },
        onPageBuilder: (BuildContext context, LoginViewModel _viewModel) =>
            DefaultTabController(
              length: 2,
              child: Scaffold(
                key: _viewModel.scaffoldState,
                body: SafeArea(
                  child: Column(
                    children: [
                      buildAnimatedContainer(context),
                      buildTabBarContainer(context),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: context.paddingNormal,
                          child: buildForm(_viewModel, context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
      duration: context.durationLow,
      height:
          context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      child: Image.asset(ImageConstants.instance.hotDog),
    );
  }

  Container buildTabBarContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
        color: context.colors.background,
      ),
      child: buildTabBar(context),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        labelStyle: context.textTheme.headlineSmall,
        unselectedLabelStyle: context.textTheme.headlineSmall,
        labelColor: Colors.black,
        indicatorColor: Colors.yellow,
        indicatorWeight: 5,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(text: LocaleKeys.login_tab1.locale),
          Tab(text: LocaleKeys.login_tab2.locale),
        ]);
  }

  Form buildForm(LoginViewModel _viewModel, BuildContext context) {
    return Form(
      key: _viewModel.formState,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          Spacer(flex: 6),
          buildFormFieldEmail(context, _viewModel),
          buildFormFieldPassword(_viewModel),
          Spacer(),
          buildTextForgot(),
          Spacer(flex: 6),
          buildLoginButton(context, _viewModel),
          Spacer(),
          buildForgotPasswordRichText(),
          Spacer()
        ],
      ),
    );
  }

  Align buildTextForgot() => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(LocaleKeys.login_forgotText.locale));

  Widget buildFormFieldPassword(LoginViewModel _viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: _viewModel.passwordController,
        obscureText: _viewModel.isLockOpen,
        validator: (value) => value!.isNotEmpty ? null : "Required",
        decoration: InputDecoration(
          focusColor: Colors.black12,
          suffixIcon: InkWell(
              onTap: () {
                _viewModel.isLockStateChange();
              },
              child:
                  Icon(_viewModel.isLockOpen ? Icons.lock : Icons.lock_open)),
          labelText: LocaleKeys.login_password.locale,
          icon: buildContainerIconField(context, Icons.lock),
        ),
      );
    });
  }

  TextFormField buildFormFieldEmail(
      BuildContext context, LoginViewModel _viewModel) {
    return TextFormField(
      controller: _viewModel.emailController,
      validator: (value) => value!.isValidEmails ? "Not Valid" : null,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.locale,
        icon: buildContainerIconField(context, Icons.email),
      ),
    );
  }

  Container buildContainerIconField(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.background),
    );
  }

  Widget buildLoginButton(BuildContext context, LoginViewModel _viewModel) {
    return Observer(builder: (_) {
      return ElevatedButton(
        onPressed: _viewModel.isLoading
            ? null
            : () {
                _viewModel.fetchLoginService();
              },
        child: Center(
          child: Text(LocaleKeys.login_login.locale,
              style: context.textTheme.headlineSmall),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: context.colors.onError,
            padding: context.paddingNormal,
            shape: StadiumBorder()),
      );
    });
  }

  Text buildForgotPasswordRichText() {
    return Text.rich(TextSpan(children: [
      TextSpan(text: LocaleKeys.login_dontAccount.locale),
      TextSpan(
        text: LocaleKeys.login_tab2.locale,
        recognizer: TapGestureRecognizer()..onTap = () {},
      ),
    ]));
  }
}
