import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serener/views/login.dart';
import 'package:serener/widgets/controllers.dart';
import 'package:serener/widgets/create_user.dart';
import 'package:serener/widgets/myButton.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myText.dart';
import 'package:serener/widgets/myTextFormField.dart';
import 'package:serener/widgets/size_config.dart';
import 'package:serener/widgets/snack_messages.dart';
import 'package:serener/widgets/validator.dart';
import 'package:http/http.dart' as http;

import '../post/authprovider.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  // Future<http.Response?> signUp(UserSignUp data) async {
  //   http.Response? signUpResponse;
  //   var url = Uri.parse("https://serener-app.herokuapp.com/api/signup");
  //   Map<String, String> requestHeaders = {
  //     "Content-type": "application/json",
  //     "Accept": "/",
  //   };

  //   try {
  //     signUpResponse = await http.post(url,
  //         headers: requestHeaders, body: jsonEncode(data.toJson()));
  //     if (signUpResponse.statusCode == 201) {
  //       setState(() {
  //         signUpIsLoading = true;
  //       });
  //       print('Account created successfully');
  //       // ignore: use_build_context_synchronously
  //       Navigator.pushNamed(context, 'Login');
  //     } else {
  //       print('Failed');
  //     }
  //   } catch (e, s) {
  //     print(e);
  //     print(s);
  //   }
  //   Future.delayed(const Duration(seconds: 3)).then((value) {
  //     signUpIsLoading = false;
  //     setState(() {});
  //   });
  //   return signUpResponse;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Palette.kBackgroundColorWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    myText(
                      data: 'Please, enter your details below.',
                      textAlign: TextAlign.center,
                      color: Palette.kTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(31)),
                myText(
                  data: 'First Name',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                KTextFormField(
                    hint: "First Name",
                    textEditingController: firstNameController,
                    keyboardType: TextInputType.name,
                    obscureText: false,
                    validator: Validator().validateFullName,
                    width: double.infinity,
                    isPasswordType: false),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText(
                          data: 'Last Name',
                          textAlign: TextAlign.center,
                          color: Palette.kTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        SizedBox(
                          width: 200,
                          child: KTextFormField(
                              hint: "Last Name",
                              textEditingController: lastNameController,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              validator: Validator().validateLastName,
                              width: getProportionateScreenWidth(200),
                              isPasswordType: false),
                        ),
                      ],
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        myText(
                          data: 'Age',
                          textAlign: TextAlign.center,
                          color: Palette.kTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: getProportionateScreenHeight(8)),
                        SizedBox(
                          width: 110,
                          child: KTextFormField(
                              hint: "Age",
                              textEditingController: ageController,
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              validator: Validator().validatePhoneNumber,
                              width: getProportionateScreenWidth(110),
                              isPasswordType: false),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(16)),
                myText(
                  data: 'Email Address',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                KTextFormField(
                    hint: "Email Address",
                    textEditingController: signUpEmailController,
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    validator: Validator().validateEmail,
                    width: double.infinity,
                    isPasswordType: false),
                SizedBox(height: getProportionateScreenHeight(8)),
                SizedBox(height: getProportionateScreenHeight(16)),
                myText(
                  data: 'Phone Number',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                KTextFormField(
                    hint: "PhoneNumber",
                    textEditingController: phoneController,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    validator: Validator().validatePhoneNumber,
                    width: double.infinity,
                    isPasswordType: false),
                SizedBox(height: getProportionateScreenHeight(16)),
                myText(
                  data: 'Password',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: getProportionateScreenHeight(8)),
                KTextFormField(
                  hint: "password",
                  textEditingController: signUpPasswordController,
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
                myText(
                  data: 'Mininum of 8 Characters.',
                  color: Palette.kTextColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
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
                        if (firstNameController.text.isEmpty ||
                            lastNameController.text.isEmpty ||
                            ageController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            signUpEmailController.text.isEmpty ||
                            signUpPasswordController.text.isEmpty) {
                          showMessage(
                              message: 'All fields are required.',
                              context: context);
                        } else {
                          auth.SignupUser(
                              firstName: firstNameController.text.trim(),
                              lastName: lastNameController.text.trim(),
                              age: ageController.text.trim(),
                              phoneNumber: phoneController.text.trim(),
                              email: signUpEmailController.text.trim(),
                              password: signUpPasswordController.text,
                              context: context);
                        }
                      },
                      status: auth.isLoading,
                      height: 54,
                      width: double.infinity,
                      borderRadius: 8,
                      color: Palette.kBackgroundColor,
                      child: loginIsLoading == false
                          ? myText(data: 'Sign Up', color: Palette.kColorWhite)
                          : Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 5, color: Palette.kColorGold)));
                }),

                // myButton(

                //     onTap: () {
                //       signUp(UserSignUp(
                //           password: signUpPasswordController.text.trim(),
                //           email: signUpEmailController.text.trim(),
                //           age: ageController.text.trim(),
                //           firstname: firstNameController.text.trim(),
                //           lastname: lastNameController.text.trim(),
                //           phonenumber: phoneController.text.trim()));
                //     },
                //     height: 54,
                //     width: double.infinity,
                //     borderRadius: 8,
                //     color: Palette.kBackgroundColor,
                //     child: signUpIsLoading == false
                //         ? myText(data: 'SignUp', color: Palette.kColorWhite)
                //         : Center(
                //             child: CircularProgressIndicator(
                //                 strokeWidth: 5, color: Palette.kColorGold))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
