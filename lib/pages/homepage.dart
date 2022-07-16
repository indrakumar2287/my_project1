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
              children:[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    border: Border.all(color: Colors.cyanAccent),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
                child: Text("Home Page",style: TextStyle(
                fontSize: 30,
                color: Colors.grey.shade900,
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
