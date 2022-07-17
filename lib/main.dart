import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_project1/data.dart';
import 'package:my_project1/database/database.dart';
import 'package:my_project1/pages/login_page.dart';
import 'package:my_project1/pages/profile.dart';
import 'package:my_project1/pages/signup_page.dart';
import 'pages/homepage.dart';
import 'package:my_project1/drawer.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(channelKey: 'key1',
          channelName: "Indra App Example",
          channelDescription: 'Notification Example',
          defaultColor: Colors.pink,
          ledColor: Colors.white,
          playSound: true,
          enableLights: true,
          enableVibration: true,
        ),

      ]);
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
      initialRoute: "home",
      routes: {
        "home": (context) => Homepage(),
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignupPage(),
        "drawer": (context) => const MyDrawer(),
        'profile': (context) => const MyProfile(),
        'database' : (context) => const Database(),
        'data' : (context) => const Data(),
      },
    );
  }
}
void Notify() async{
  String timezone =await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(content: NotificationContent(
    id: 1,
    channelKey: 'key1',
    title: "This is Notification Title",
    body: "This is body of notification",
    // bigPicture: "assets/images/not2.png",
    bigPicture: 'https://www.pngall.com/wp-content/uploads/2016/04/50-Off-PNG-Clipart-Background.png',
    notificationLayout: NotificationLayout.BigPicture,
  ),
  // schedule: NotificationInterval(interval: 5,timeZone: timezone,repeats: true),
  );
}