import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_project1/drawer.dart';
import 'package:my_project1/main.dart';

import '../database/get_user_name.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


class Homepage extends StatelessWidget {

  List<String> docIds =[];

  Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app",style: TextStyle(
          fontSize: 25,
        ),),
        // title: GetUserName(documentId: docIds[]),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      drawer: MyDrawer(),
      body: Container(
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
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
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
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        child: IconTheme(
          data: IconThemeData(
            color: Colors.black,
          ), child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart)),
            IconButton(onPressed: (){}, icon: Icon(Icons.category)),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'profile');
            }, icon: Icon(Icons.person)),
          ],

        ),
        ),
      ),
    );
  }
}
