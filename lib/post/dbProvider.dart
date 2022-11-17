import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _ref = SharedPreferences.getInstance();

  String _token = '';
  String _userId = '';

  String get token => _token;
  String get userId => _userId;

  void saveToken(String token) async {
    SharedPreferences value = await _ref;

    value.setString('token', token);
  }

  void saveUserId(String id) async {
    SharedPreferences value = await _ref;

    value.setString('id', id);
  }

  Future<String> getToken() async {
    SharedPreferences value = await _ref;

    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserId() async {
    SharedPreferences value = await _ref;

    if (value.containsKey('userId')) {
      String data = value.getString('userId')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  void logOut(BuildContext context) async {
    final value = await _ref;

    value.clear();
    Navigator.pushReplacementNamed(context, 'Login');
  }
}
