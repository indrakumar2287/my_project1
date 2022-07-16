import 'dart:ui';

import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(
        //     "Profile",
        //     style: TextStyle(
        //       fontSize: 25,
        //     ),
        //   ),
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        // body:

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/image3.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.overlay)
              )
          ),

          child: SingleChildScrollView(
          child: Card(
            // elevation: 10,
            // shadowColor: Colors.blue,
            margin: EdgeInsets.only(
                left: 40,
                top: MediaQuery.of(context).size.height * 0.2,
                bottom: MediaQuery.of(context).size.height * 0.2,
                right: 40),
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),

            ),
            child: Container(
              // margin: EdgeInsets.only(
              //     left: 20,
              //     top: 20,
              //     bottom: 40,
              //     right: 40),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/images/image3.jpg'),fit: BoxFit.fill,
              //     // colorFilter: ColorFilter.mode(Colors.grey, BlendMode.overlay)
              //   ),
              // ),
              child:
                Column(
                 children: [
                   BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                     child: Container(
                       color: Colors.transparent,
                     ),
                   ),
                   Container(
                     // color: Colors.deepOrangeAccent,
                   margin: EdgeInsets.only(bottom: 20,top: 20),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                   ),

                   child: Text('Profile',style: TextStyle(
                     fontSize: 50,
                     fontWeight: FontWeight.bold,
                     color: Colors.white70,
                     fontFamily: 'Font3'
                   ),),),
                   TextField(
                   decoration: InputDecoration(
                     fillColor: Colors.blue.shade100,
                     // labelText: 'Name',
                     filled: true,
                     hintText: 'Name',
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)
                     )
                   ),
                 ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Colors.blue.shade100,
                        // labelText: 'Name',
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                   SizedBox(
                     height: 30,
                   ),
                   TextField(
                     obscureText: true,
                     decoration: InputDecoration(
                         fillColor: Colors.blue.shade100,
                         // labelText: 'Name',
                         filled: true,
                         hintText: 'Password',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)
                         )
                     ),
                   ),
                   SizedBox(
                     height: 50,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(decoration: BoxDecoration(
                         color: Colors.deepOrangeAccent,
                         border: Border.all(color: Colors.black),
                         borderRadius: BorderRadius.circular(15),
                       ),
                         child: TextButton(onPressed: (){}, child: Text('Profile',style: TextStyle(
                           fontSize: 15,
                           color: Colors.black
                         ),),),
                       ),
                       Container(decoration: BoxDecoration(
                         color: Colors.deepOrangeAccent,
                         border: Border.all(color: Colors.black),
                         borderRadius: BorderRadius.circular(15),
                       ),
                         child: TextButton(onPressed: (){}, child: Text('Picture',style: TextStyle(
                             fontSize: 15,
                             color: Colors.black
                         ),)),
                       ),
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   // TextButton(onPressed: (){}, child: child)
            ],
          ),

            ),
          ),
        ),
        );



  }
}
