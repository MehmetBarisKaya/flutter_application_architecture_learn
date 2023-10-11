import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class AutoLocaleText extends StatelessWidget {
  final String value;
  final TextAlign? textAlign;
  final TextStyle? style;

  const AutoLocaleText({required this.value, this.textAlign, this.style});
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.locale,
      textAlign: textAlign,
      style: style,
    );
  }
}
