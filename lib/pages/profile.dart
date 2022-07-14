import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
        appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xff4c505b),
            child: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          Text(
            "Click Above",
            style: GoogleFonts.alike(
                textStyle: Theme.of(context).textTheme.displayMedium,
                fontSize: 40),
          )
        ],
      ),),
    ));
  }
}
