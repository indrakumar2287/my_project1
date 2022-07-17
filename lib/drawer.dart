import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 25,bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/indra.jpg"),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Text("Indra Prajapat",style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),),
                  Text("indraxyz123@gmail.com",style: TextStyle(
                    color: Colors.white,
                  ),)
                ],
              ),
            ),

          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'profile');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting',style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.pushNamed(context, 'setting');
            },
          ),
          ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Database',style: TextStyle(fontSize: 18),),
              onTap: (){Navigator.pushNamed(context, 'database');}
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Log Out',style: TextStyle(fontSize: 18),),
            onTap: (){Navigator.pushNamed(context, 'login');}
          ),

        ],
      )

    );
  }
}
