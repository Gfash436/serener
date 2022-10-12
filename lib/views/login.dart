import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:serener/views/homePage.dart';
import 'package:serener/widgets/myButton.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myText.dart';
import 'package:serener/widgets/myTextFormField.dart';
import 'package:serener/widgets/size_config.dart';
import 'package:serener/widgets/user_login.dart';
import 'package:serener/widgets/validator.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool toggle = true;

  Future<http.Response?> login(UserLogin data) async {
    http.Response? loginResponse;
    var url = Uri.parse("https://serener-app.herokuapp.com/api/login");
    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "/",
    };

    try {
      loginResponse = await http.post(url,
          headers: requestHeaders, body: jsonEncode(data.toJson()));
      if (loginResponse.statusCode == 202) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
        if (kDebugMode) {
          print("Response status: ${loginResponse.statusCode}");
          print("Response body: ${loginResponse.body}");
          var responseData = jsonDecode(loginResponse.body);
          print(responseData);
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
    }
    return loginResponse;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.kBackgroundColorWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(40)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    myText(
                      data: 'Welcome, ',
                      textAlign: TextAlign.center,
                      color: Palette.kTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    myText(
                      data: 'firstName',
                      textAlign: TextAlign.center,
                      color: Palette.kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                myText(
                  data: 'Email Address',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                KTextFormField(
                    hint: "Email Address",
                    textEditingController: emailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    validator: Validator().validateEmail,
                    width: double.infinity,
                    isPasswordType: false),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                myText(
                  data: 'Password',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                KTextFormField(
                  hint: "password",
                  textEditingController: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: toggle,
                  passwordIcon: GestureDetector(
                      onTap: () {
                        if (toggle == true) {
                          setState(() {
                            toggle = false;
                          });
                        } else {
                          setState(() {
                            toggle = true;
                          });
                        }
                      },
                      child: toggle == true
                          ? Icon(
                              Icons.visibility_off_outlined,
                              color: Palette.kBackgroundColor,
                            )
                          : Icon(Icons.visibility,
                              color: Palette.kBackgroundColor)),
                  validator: Validator().validatePassword,
                  width: double.infinity,
                  isPasswordType: true,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: myText(
                        data: 'forgot password?',
                        textAlign: TextAlign.center,
                        color: Palette.kTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(100),
                ),
                myButton(
                    onTap: () {
                      login(UserLogin(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    },
                    height: 54,
                    width: double.infinity,
                    borderRadius: 8,
                    color: Palette.kBackgroundColor,
                    child: myText(data: 'Login', color: Palette.kColorWhite)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
