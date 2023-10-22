// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';
import 'package:fluttermvvmtemplate/view/settings/service/setting_web_view.dart';
import 'package:kartal/kartal.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsWebView extends StatelessWidget {
  const SettingsWebView({
    Key? key,
    required this.model,
  }) : super(key: key);

  final SettingsWebModel model;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(model.url ?? ApplicationConstants.APP_WEB_SITE));
    // #enddocregion webview_controller
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          model.title,
          style: context.general.textTheme.titleLarge,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
