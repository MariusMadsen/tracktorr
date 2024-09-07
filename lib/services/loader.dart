import 'package:flutter/material.dart';

class Loader {
  Loader._();

  static void load(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
        barrierDismissible: false);
  }

  static void loadComplete(BuildContext context) {
    Navigator.pop(context);
  }
}
