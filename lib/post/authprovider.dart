import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:serener/models/baseurl.dart';
import 'package:serener/post/dbProvider.dart';
import 'package:serener/views/signUp.dart';
import 'package:serener/views/homepage.dart';
import 'package:serener/views/login.dart';

import 'package:serener/widgets/routers.dart';

class AuthenticationProvider extends ChangeNotifier {
  //Base Url
  final requestBaseUrl = ApiUrl.baseUrl;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  //Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  //An null function to Register User
  void SignupUser(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email,
      required String password,
      required String age,
      BuildContext? context}) async {
    _isLoading = false;
    notifyListeners();

    //Initialize Url
    String url = "$requestBaseUrl/api/signup";

    //Create the payload(body) that the API needs
    final body = {
      "firstName": firstName,
      "lastName": lastName,
      "age": age,
      "phoneNumber": phoneNumber,
      "password": password,
      "email": email,
    };
    print(body);

    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "/",
    };

    //Rap request in try&catch because errors from the internet
    try {
      http.Response request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      if (request.statusCode == 201) {
        final response = json.decode(request.body);
        print(response);
        _isLoading = false;
        _resMessage = "Account Created";
        notifyListeners();

        //save user data and move to Login
        final userId = response['userId'];
        DatabaseProvider().saveUserId(userId);

        Navigator.push(
            context!, CupertinoPageRoute(builder: (context) => const Login()));
      } else {
        final response = json.decode(request.body);

        _resMessage = response['message'];

        print(response);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Please try again';
      notifyListeners();
      print(":::(e)");
    }
  }

// A null function to Login Users
  void LoginUser(
      {required String email,
      required String password,
      BuildContext? context}) async {
    _isLoading = false;
    notifyListeners();

    //Initialize Url
    String url = "$requestBaseUrl/api/login";

    //Create the payload(body) that the API needs
    final body = {
      "email": email,
      "password": password,
    };
    print(body);

    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "/",
    };

    //Rap request in try&catch because errors from the internet
    try {
      http.Response request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      if (request.statusCode == 202) {
        final response = json.decode(request.body);
        print(response);
        _isLoading = false;
        _resMessage = "Login Successfully";
        notifyListeners();

        //Save user data and then navigate to homepage
        final authToken = response['token'];
        DatabaseProvider().saveToken('token');
        PageNavigator(ctx: context).nextPageOnly(page: const Homepage());
      } else {
        final response = json.decode(request.body);

        _resMessage = response['message'];
        print(response);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available !';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Please try again';
      notifyListeners();
      print(":::(e)");
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
