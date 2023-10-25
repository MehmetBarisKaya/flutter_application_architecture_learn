// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    Key? key,
    required this.value,
  }) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
