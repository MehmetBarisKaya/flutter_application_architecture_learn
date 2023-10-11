// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/components/button/icon_button.dart';

class MVVMLoginButton extends StatelessWidget {
  const MVVMLoginButton({
    Key? key,
    required this.onComplete,
  }) : super(key: key);
  final Function(String data) onComplete;

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      onPressed: () {
        onComplete("OKEY");
      },
      icon: Icons.access_time,
    );
  }
}
