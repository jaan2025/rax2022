

import 'package:flutter/material.dart';
import 'package:flutter_management/Screens/Alldatascreen.dart';
import 'package:flutter_management/Screens/Login.dart';
import 'package:flutter_management/Screens/homescreen.dart';
import 'package:flutter_management/responsive/id.dart';

import '../Screens/schooldetails.dart';


class AppTheme extends StatelessWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppId.initialRoute,
      routes: <String, WidgetBuilder>{
        AppId.LoginID: (context) => const Login(),
        AppId.Alldatascreen : (context) => const Alldatascreen(),
        AppId.HomeScreenId : (context) => const HomeScreen(),
        //AppId.SchoolDetailsId:(context) => schooldetails(secondsheetmodel: , ),
      },


    );
  }
}
