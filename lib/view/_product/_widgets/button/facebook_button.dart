import 'package:flutter/material.dart';

import '../../../../core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({required this.onComplete, super.key});

  final Function(FaceBookModel data, {String errorMessage}) onComplete;
  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: "FacBook Login",
      onPressed: () {
        this.onComplete(FaceBookModel("token", "mail"));
        // else this.onComplete(null,errorMessage: "Failed");
      },
    );
  }
}

class FaceBookModel {
  final String token;
  final String mail;

  FaceBookModel(this.token, this.mail);
}
