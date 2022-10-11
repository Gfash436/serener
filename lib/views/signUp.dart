import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serener/widgets/myButton.dart';
import 'package:serener/widgets/myColor.dart';
import 'package:serener/widgets/myText.dart';
import 'package:serener/widgets/myTextFormField.dart';
import 'package:serener/widgets/size_config.dart';
import 'package:serener/widgets/validator.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  late TabController tabController;
  bool toggle = true;

  void signUp(
      String firstName, lastName, age, email, phoneNumber, password) async {
    try {
      Response response = await post(
          Uri.parse('https://serener-app.herokuapp.com/api/signup'),
          body: {
            'firstName': firstName,
            'lastName': lastName,
            'age': age,
            'email': email,
            'phoneNumber': phoneNumber,
            'password': password
          });
      if (response.statusCode == 200) {
        var userData = jsonDecode(response.body.toString());
        print(userData['token']);
        print('Account created successfully');
      } else {
        print('Account creation failed');
      }
    } catch (e, s) {
      print(e.toString());
      print(s.toString());
    }
  }

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
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
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
                SizedBox(
                  height: getProportionateScreenHeight(31),
                ),
                myText(
                  data: 'First Name',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(
                          height: getProportionateScreenHeight(8),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(200),
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
                    SizedBox(
                      width: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(120),
                      child: Column(
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
                          KTextFormField(
                              hint: "Age",
                              textEditingController: ageController,
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              validator: Validator().validatePhoneNumber,
                              width: double.infinity,
                              isPasswordType: false),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
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
                  height: getProportionateScreenHeight(8),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(16),
                ),
                myText(
                  data: 'Phone Number',
                  textAlign: TextAlign.center,
                  color: Palette.kTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(8),
                ),
                KTextFormField(
                    hint: "PhoneNumber",
                    textEditingController: phoneController,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    validator: Validator().validatePhoneNumber,
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
                myText(
                  data: 'Mininum of 8 Characters.',
                  color: Palette.kTextColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                myButton(
                    onTap: () {
                      signUp(
                          firstNameController.text.toString(),
                          lastNameController.text.toString(),
                          ageController.text.toString(),
                          emailController.text.toString(),
                          phoneController.text.toString(),
                          passwordController.text.toString());
                      Navigator.pushNamed(context, 'Login');
                    },
                    height: 54,
                    width: double.infinity,
                    borderRadius: 8,
                    color: Palette.kBackgroundColor,
                    child: myText(data: 'SignUp', color: Palette.kColorWhite)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
