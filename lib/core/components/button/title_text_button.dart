// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/button/normal_button.dart';

class TitleTextButton extends StatelessWidget {
  const TitleTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: this.onPressed,
      widget: Center(
        child: Text(text),
      ),
    );
  }
}
