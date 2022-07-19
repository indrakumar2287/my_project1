
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUser extends StatelessWidget {
  
  final String documentId;
  final String username;

  GetUser({required this.documentId, required this.username});

  @override
  Widget build(BuildContext context) {
    CollectionReference users= FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>
      (future : users.doc(documentId).get(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as
          Map<String,dynamic>;
          return Text('${data['Name']}');
        };
        return Text('Loading ....',textAlign: TextAlign.center,);
      },
    );
  }
}

