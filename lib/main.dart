import 'package:flutter/material.dart';
import 'package:companion/pages/login_page.dart';
import 'package:companion/widgets/routes.dart';
import 'pages/home.dart';

void main() async {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,

      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),


      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}