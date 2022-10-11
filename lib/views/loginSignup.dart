import 'package:flutter/material.dart';
import 'package:serener/views/signUp.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myText.dart';

import 'login.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State<LoginSignup> createState() => _LoginSignupState();
}

class _LoginSignupState extends State<LoginSignup> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.kBackgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myText(
                data: 'Sere',
                color: Palette.kColorGold,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),
              myText(
                data: 'ner',
                color: Palette.kColorWhite,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              )
            ],
          ),
          // centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(text: 'Login'),
            Tab(
              text: 'Sign up',
            )
          ]),
        ),
        body: TabBarView(children: [const Login(), SignUp()]),
      ),
    );
  }
}
