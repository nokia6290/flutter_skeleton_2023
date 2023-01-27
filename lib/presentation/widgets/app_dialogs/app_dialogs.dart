import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/business/services/base_class.dart';

class AppDialogs with BasePage {
  static void showSimpleDialog(
    BuildContext context,
    String errorTitle,
    String errorMessage,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(errorTitle),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: Text("generic_ok", style: null),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
