import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static final boxShadow = [
     const BoxShadow(
        offset: Offset(10, 10), color: Colors.black38, blurRadius: 20),
    BoxShadow(
        offset: const Offset(-5, -5),
        color: Colors.white.withOpacity(0.85),
        blurRadius: 20)
  ];


  static String secretValue = 'hasura@1907';
  static String psqlDb = 'secret';
  static String secretKey = 'x-hasura-admin-secret';
  static String login = 'login';
  static dynamic password = 'password';

  getStringFormSharePreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  removeStringFormSharePreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

}
