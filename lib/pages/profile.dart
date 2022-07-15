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
              margin: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 40,
                  right: 40),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/login5.jpg'),
                )
              ),
              child:
                Column(
                 children: [
                   Container(
                     // color: Colors.deepOrangeAccent,
                   margin: EdgeInsets.only(bottom: 20),
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
                     height: 30,
                   ),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       ElevatedButton(onPressed: (){}, child: Text('Profile'),
                         style: ButtonStyle(
                           backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                           foregroundColor: MaterialStateProperty.all(Colors.black)
                         ),
                       ),
                       ElevatedButton(onPressed: (){}, child: Text('Picture'),
                         style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                             foregroundColor: MaterialStateProperty.all(Colors.black)
                         ),
                       )
                     ],
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
