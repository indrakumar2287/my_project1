import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/database/get_user_name.dart';
import '../database/get_email.dart';
import './signup_page.dart';



class Database extends StatefulWidget {
  const Database({Key? key}) : super(key: key);

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
  // final user=FirebaseAuth.instance.currentUser!;
  List<String> docIds =[];

  //Get IDs
  Future getIds() async {
    await FirebaseFirestore.instance.collection('Users').get().
    then((snapshot) => snapshot.docs.forEach((document) {
      // print(document.reference);
      docIds.add(document.reference.id);
    })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image6.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          Scrollbar(
            // thumbVisibility: false,
            trackVisibility: true,
            thickness: 5,
                child: FutureBuilder(
                  future: getIds(),
                  builder: (context,snapshot){
                    return ListView.builder(
                        itemCount: docIds.length,
                        itemBuilder: (context,index){
                      return ListTile(
                        leading: Icon(Icons.person,size: 40,),
                        title: Container(
                            child: GetUserName(documentId: docIds[index])),
                        iconColor: Colors.deepPurpleAccent,
                        textColor: Colors.white,
                        subtitle: GetEmail(documentId: docIds[index]),
                        // trailing: Icon(Icons.arrow_forward),
                      );
                    });
                  },
                )
          ),
        ],
      ),

    );
  }
}
