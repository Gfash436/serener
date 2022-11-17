import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serener/views/homePage.dart';
import 'package:serener/widgets/controllers.dart';
import 'package:serener/widgets/myButton.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myText.dart';
import 'package:serener/widgets/myTextFormField.dart';
import 'package:serener/widgets/routers.dart';
import 'package:serener/widgets/size_config.dart';
import 'package:serener/widgets/user_login.dart';
import 'package:serener/widgets/validator.dart';
import 'package:http/http.dart' as http;

import '../post/authprovider.dart';
import '../widgets/snack_messages.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();
  // Future<http.Response?> login(UserLogin data) async {
  //   http.Response? loginResponse;
  //   var url = Uri.parse("https://serener-app.herokuapp.com/api/login");
  //   Map<String, String> requestHeaders = {
  //     "Content-type": "application/json",
  //     "Accept": "/",
  //   };

  //   try {
  //     loginResponse = await http.post(url,
  //         headers: requestHeaders, body: jsonEncode(data.toJson()));
  //     if (loginResponse.statusCode == 202) {
  //       setState(() {
  //         loginIsLoading = true;
  //       });

  //       print('Login successfully');
  //       Navigator.pushNamed(context, 'Homepage');
  //     } else {
  //       print('Login failed');
  //     }
  //   } catch (e, s) {
  //     print(e);
  //     print(s);
  //   }
  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     loginIsLoading = false;
  //     setState(() {});
  //   });
  //   return loginResponse;
  // }

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
                    textEditingController: _loginEmailController,
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
                  textEditingController: _loginPasswordController,
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
                        data: 'Forgot password?',
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
                Consumer<AuthenticationProvider>(
                    builder: (context, auth, snapshot) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    if (auth.resMessage != "") {
                      showMessage(message: auth.resMessage, context: context);

                      //clear the response message to avoide duplicate
                      auth.clear();
                    }
                  });
                  return myButton(
                      onTap: () {
                        if (_loginEmailController.text.isEmpty ||
                            _loginPasswordController.text.isEmpty) {
                          showMessage(
                              message: 'Enter correct information',
                              context: context);
                        } else {
                          auth.LoginUser(
                              email: _loginEmailController.text.trim(),
                              password: _loginPasswordController.text,
                              context: context);
                        }
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const Homepage()));
                        // login(UserLogin(
                        //     email: loginEmailController.text.trim(),
                        //     password: loginPasswordController.text.trim()));
                      },
                      status: auth.isLoading,
                      height: 54,
                      width: double.infinity,
                      borderRadius: 8,
                      color: Palette.kBackgroundColor,
                      child: loginIsLoading == false
                          ? myText(data: 'Login', color: Palette.kColorWhite)
                          : Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 5, color: Palette.kColorGold)));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
