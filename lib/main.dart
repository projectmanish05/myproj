import 'package:flutter/material.dart';
import 'package:mytask/pages/home_page.dart';
import 'package:mytask/pages/login/login_page.dart';
import 'package:mytask/pages/login/register.dart';
import 'package:mytask/pages/login/second_screen.dart';
//import 'package:mytask/pages/login/third.dart';



void main() => runApp(MyApp());

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/second': (BuildContext context) => new Second_Screen(),
//  '/third': (BuildContext context) => new Third(),
  '/': (BuildContext context) => new LoginPage(),
};

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Sqflite App',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}
