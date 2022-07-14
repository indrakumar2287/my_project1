import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_project1/drawer.dart';
import 'package:flutter/src/material/icons.dart';
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
      // padding: EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile",style: TextStyle(
            fontSize: 25,
          ),),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body:Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff4c505b),
              child: IconButton(
                color: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, 'home');
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Text("Click Above",style:GoogleFonts.alike(textStyle: Theme.of(context).textTheme.displayMedium,fontSize: 40),)
          ],
          ),



        )

    );

  }

}


