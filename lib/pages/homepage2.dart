import 'package:flutter/material.dart';
import 'package:my_project1/pages/view.dart';
import '../drawer.dart';
import 'demo.dart';
import 'profile.dart';
import 'notification.dart';


class MyHomepage2 extends StatefulWidget {
  const MyHomepage2({Key? key}) : super(key: key);

  @override
  State<MyHomepage2> createState() => _MyHomepage2State();
}

class _MyHomepage2State extends State<MyHomepage2> {
  static int  _selectedItem=0;
  static List<Widget> _widgetoption = <Widget>[
    MyNotification(),
    Demo(),
    View(),
    MyProfile(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app",style: TextStyle(
          fontSize: 25,
        ),),),
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
}
