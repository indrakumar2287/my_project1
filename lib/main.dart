import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/data.dart';
import 'package:my_project1/database/database.dart';
import 'package:my_project1/drawer.dart';
import 'package:my_project1/pages/demo.dart';
import 'package:my_project1/pages/profile.dart';
import 'package:my_project1/pages/homepage2.dart';
import 'package:my_project1/pages/login_page.dart';
import 'package:my_project1/pages/notification.dart';
import 'package:my_project1/pages/signup_page.dart';
import 'package:my_project1/pages/view.dart';
// import 'package:passcode_screen/passcode_screen.dart';

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

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c = const Color(0xFFFF2400);
    MaterialColor mycolor = MaterialColor(0xFFC62168, color);
    MaterialColor mycolor2 = MaterialColor(0xFF98B4D4, color);
    MaterialColor mycolor3 = MaterialColor(0xFFFF6F61, color);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: mycolor3),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "home",
      routes: {
        "home": (context) => const MyHomepage2(),
        "login": (context) => const LoginPage(),
        "signup": (context) => const SignupPage(),
        "drawer": (context) => const MyDrawer(),
        'database': (context) => const Database(),
        'data': (context) => const Data(),
        'demo': (context) => const Demo(),
        'view': (context) => const View(),
        'notification': (context) => const MyNotification(),
        // 'passcode' : (context) => const PassCode(),
      },
    );
  }
}

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

class MyColor extends MaterialStateColor {
  const MyColor() : super(_defaultColor);

  static const int _defaultColor = 0xFFFF2400;
  static const int _pressedColor = 0xdeadbeef;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}
