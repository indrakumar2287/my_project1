import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/pages/category.dart';
import 'package:my_project1/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../drawer.dart';
import 'cart.dart';
import 'profile.dart';
import 'notification.dart';


class MyHomepage2 extends StatefulWidget {
  MyHomepage2({Key? key}) : super(key: key);

  String docId = '';
  String userId = "";

  @override
  State<MyHomepage2> createState() => _MyHomepage2State();
}

class _MyHomepage2State extends State<MyHomepage2> {
late String name;



  static int  _selectedItem=0;
  static List<Widget> _widgetoption = <Widget>[
    MyNotification(),
    Cart(),
    Category(),
    MyProfile(),
  ];



  @override
  Widget build(BuildContext context) {
    getName2();
    // final user = FirebaseAuth.instance.currentUser!;
     return Scaffold(
      // appBar: AppBar(
        // title: const Text("Catalog app",style: TextStyle(
        //   fontSize: 25,
        // ),),),
      appBar: AppBar(
        title: Text(name),
      ),
      drawer: MyDrawer(),
      body: _widgetoption.elementAt(_selectedItem),
      bottomNavigationBar:BottomNavigationBar(
    items:<BottomNavigationBarItem> [
    BottomNavigationBarItem(
    icon: Icon(Icons.home,color: Colors.black,),
    backgroundColor: Theme.of(context).primaryColor,
    label: 'Home'
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart,color: Colors.black,),
    backgroundColor: Theme.of(context).primaryColor,
    label: 'Cart'
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.category,color: Colors.black,),
    backgroundColor: Theme.of(context).primaryColor,
    label: 'Category'
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person,color: Colors.black,),
    backgroundColor: Theme.of(context).primaryColor,
    label: 'Profile'
    ),
    ],
    currentIndex: _selectedItem,
    iconSize: 20,
    onTap: (int position) {
    setState(() {
    _selectedItem = position;
    });
    },),
    );
  }

getName2() async
{
  var pref = await SharedPreferences.getInstance();

  String name3 = pref.getString('Name2')!;
  setState(() {
    name=name3;
  });
}
}
