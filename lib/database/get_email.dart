
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetEmail extends StatelessWidget {
  final String documentId;

  GetEmail({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference emails= FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>
      (future : emails.doc(documentId).get(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as
          Map<String,dynamic>;
          return Text('Email : ${data['Email']}');
        };
        return Text('Loading ....',textAlign: TextAlign.center,);
      },
    );
  }
}

