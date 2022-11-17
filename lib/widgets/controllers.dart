import 'package:flutter/material.dart';

TextEditingController phoneController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();

TextEditingController signUpEmailController = TextEditingController();

TextEditingController ageController = TextEditingController();

final _formKey = GlobalKey<FormState>();
late TabController tabController;
bool toggle = true;
bool loginIsLoading = false;
bool signUpIsLoading = false;
