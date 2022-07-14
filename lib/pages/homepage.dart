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
      body: Column(
        children: [
          Text(" Home Page ",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.black54
          ),),

        ],
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
            IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          ],

        ),
        ),
      ),
    );
  }
}
