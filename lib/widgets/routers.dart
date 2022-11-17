// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PageNavigator {
  PageNavigator({this.ctx});
  BuildContext? ctx;

  //Navigator to next page
  Future nextPage({Widget? page}) {
    return Navigator.push(
        ctx!, CupertinoPageRoute(builder: ((context) => page!)));
  }

  void nextPageOnly({Widget? page}) {
    Navigator.pushAndRemoveUntil(
        ctx!, MaterialPageRoute(builder: (context) => page!), (route) => false);
  }
}


  // void navigate() {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     PageNavigator(ctx: context).nextPageOnly(page: LoginPage());
  //   });
  // }