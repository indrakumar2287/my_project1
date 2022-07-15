import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_project1/data.dart';
import 'package:my_project1/pages/login_page.dart';
import 'package:my_project1/pages/profile.dart';
import 'package:my_project1/pages/signup_page.dart';
import 'pages/homepage.dart';
import 'package:my_project1/drawer.dart';

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
      initialRoute: "login",
      routes: {
        "home": (context) => Homepage(),
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignupPage(),
        "drawer": (context) => const MyDrawer(),
        'profile': (context) => const MyProfile(),
        'data' : (context) => const Data(),
      },
    );
  }
}
