// import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class GetUserName extends StatefulWidget {

  final String documentId;


  GetUserName({required this.documentId});

  @override
  State<GetUserName> createState() => _GetUserNameState();
}

class _GetUserNameState extends State<GetUserName> {
  @override
  Widget build(BuildContext context) {

    //Get Collection
    
    CollectionReference users= FirebaseFirestore.instance.
    collection('New_Users');
    
    
    return FutureBuilder<DocumentSnapshot>
      (builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as
          Map<String,dynamic>;
          return Text('Name : ${data['Name']}');
        };
        return Text('Loading ....',textAlign: TextAlign.center,);
      },
    );
  }
}
