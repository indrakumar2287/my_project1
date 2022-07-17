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
                  image: AssetImage('assets/images/image3.jpg'),fit: BoxFit.cover,
                  filterQuality: FilterQuality.high
              )
          ),
          child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.only(
                left: 40,
                top: MediaQuery.of(context).size.height * 0.2,
                bottom: MediaQuery.of(context).size.height * 0.2,
                right: 40),
            color: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image3.jpg'),
                  fit: BoxFit.fill
                )
              ),
              child:
                Column(
                 children: [
                   BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                     child: Container(
                       color: Colors.transparent,
                     ),
                   ),
                   Container(
                     // color: Colors.deepOrangeAccent,
                   margin: EdgeInsets.only(bottom: 40,top: 10),
                   decoration: BoxDecoration(
                     color: Colors.deepOrangeAccent,
                     border: Border.all(color: Colors.black),
                     borderRadius: BorderRadius.circular(15),
                   ),

                   child: Text('Profile',style: TextStyle(
                     // backgroundColor: Colors.deepOrangeAccent,
                     fontSize: 40,
                     fontWeight: FontWeight.bold,
                     color: Colors.black,
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
                     height: 40,
                   ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
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
                       ), ],
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
