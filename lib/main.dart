import 'package:flutter/material.dart';
import 'package:my_project1/pages/demo.dart';
import 'package:my_project1/pages/login_page.dart';
import 'package:my_project1/pages/signup_page.dart';
import 'pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var number = 100;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.red),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "signup2",
      routes: {
        "home": (context) => Homepage(),
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignupPage(),
        "signup2": (context) => const MyRegister(),

      },
    );
  }
}
