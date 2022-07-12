import 'package:flutter/material.dart';
import 'package:my_project1/drawer.dart';

class Homepage extends StatelessWidget {

  Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app",style: TextStyle(
          fontSize: 25,
        ),),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.app_registration))
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
          child: Container(
        child: const Text(" Home Page ",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          color: Colors.black54
        ),),
      )),

    );
  }
}
