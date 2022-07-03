import 'package:flutter/material.dart';
import 'package:my_project1/pages/login_page.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var number = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home : homepage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData(brightness: Brightness.dark ),
      initialRoute: "/home",
     routes: {
      "/":(context) =>  Loginpage(),
      "/home":(context) => homepage(),
      "/login":(context) => Loginpage(),
     },
      
    );
  }
}
