import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showToast(BuildContext ctx, String msg) {
    final Scaffold = ScaffoldMessenger.of(ctx);
    Scaffold.showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
}
