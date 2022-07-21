import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/data.dart';
import 'package:my_project1/database/database.dart';
import 'package:my_project1/drawer.dart';
import 'package:my_project1/pages/cart.dart';
import 'package:provider/provider.dart';
import 'package:my_project1/pages/homepage2.dart';
import 'package:my_project1/pages/login_page.dart';
import 'package:my_project1/pages/notification.dart';
import 'package:my_project1/pages/signup_page.dart';
import 'package:my_project1/pages/category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Authentication/authentication_service.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'key1',
      channelName: "Indra App Example",
      channelDescription: 'Notification Example',
      defaultColor: Colors.pink,
      ledColor: Colors.white,
      playSound: true,
      enableLights: true,
      enableVibration: true,
    ),
  ]);

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MaterialColor mycolor = MaterialColor(0xFFC62168, color);
    MaterialColor mycolor2 = MaterialColor(0xFF98B4D4, color);
    MaterialColor mycolor3 = MaterialColor(0xFFFF6F61, color);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: mycolor3),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "main",
      routes: {
        "home": (context) => MyHomepage2(),
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignupPage(),
        "drawer": (context) =>  MyDrawer(),
        'database': (context) => const Database(),
        'data': (context) => const Data(),
        'cart': (context) => const Cart(),
        'category': (context) => const Category(),
        'notification': (context) => const MyNotification(),
        'main': (context) => MainPage(),
        // 'passcode' : (context) => const PassCode(),
      },
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if(snapshot.hasError)
            return Center(child: Text("Something Went Wrong"),);
          else if(snapshot.hasData){
            return MyHomepage2();
          }else{
            return LoginPage();
          }
        }
      ),
    );
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//
//     if (firebaseUser != null) {
//       return MyHomepage2();
//     }
//     return LoginPage();
//   }
// }

void Notify() async {
  String timezone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'key1',
      title: " 🪘 Sale is Live 🥂🥂",
      body: "Get Your New Products at Minimum price",
      // bigPicture: "assets/images/not2.png",
      bigPicture:
      'https://www.pngall.com/wp-content/uploads/2016/04/50-Off-PNG-Clipart-Background.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
    // schedule: NotificationInterval(interval: 5,timeZone: timezone,repeats: true),
  );
}

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

