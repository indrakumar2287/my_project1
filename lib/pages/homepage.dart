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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Home Page",style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Font2',
                    ),
                  ),
                ),

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
