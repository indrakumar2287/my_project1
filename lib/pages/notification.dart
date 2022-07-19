import 'dart:ui';

import 'package:flutter/material.dart';

import '../main.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({Key? key}) : super(key: key);

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login2.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(" Send Notification ",style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Font2',
                    ),
                    ),
                  ),
                  Icon(Icons.arrow_downward,size: 60,color: Colors.white,),
                  Container(
                    height: 75,width: 75,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                side: BorderSide(color: Colors.red)
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                      ),
                      onPressed: (){},
                      child: IconButton(
                        icon: Icon(Icons.notifications),
                        color: Colors.black,
                        onPressed: () { Notify(); },
                      ),
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
    );
  }
}
