import 'package:flutter/material.dart';
import 'package:flutter_management/responsive/id.dart';
import 'package:flutter_management/responsive/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Helper.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Home.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  autoLogin();

  //runApp(const ProviderScope(child: AppTheme()));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}



autoLogin() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var username = pref.getString(Helper.login);
  if(username==null){
    AppId.initialRoute = AppId.LoginID;
  }else{
    AppId.initialRoute = AppId.HomeScreenId;
  }
  runApp(const ProviderScope(child: AppTheme()));

}