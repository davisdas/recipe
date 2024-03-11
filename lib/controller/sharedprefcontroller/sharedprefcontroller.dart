import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController extends ChangeNotifier {
  bool? login;
  String? token;
  getlogindetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    login = prefs.getBool('login');
    notifyListeners();
  }

  logoutuser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', false);
    notifyListeners();
  }
}
