import 'package:flutter/material.dart';
import 'package:serener/widgets/myColor.dart';

void showMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: Palette.kColorWhite),
      ),
      backgroundColor: Palette.kColorGold));
}

void errorMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: Palette.kColorWhite),
      ),
      backgroundColor: Palette.kBackgroundColor));
}
