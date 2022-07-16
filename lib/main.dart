import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/drawer.dart';
import 'pages/homepage.dart';
import 'pages/login_page.dart';
import 'pages/profile.dart';
import 'pages/setting.dart';
import 'pages/signup_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: 'home',
      routes: {
        "home": (context) => Homepage(),
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignupPage(),
        "drawer": (context) => const MyDrawer(),
        'profile': (context) => const MyProfile(),
        'setting': (context) => const Setting(),
      },
    );
  }
}
