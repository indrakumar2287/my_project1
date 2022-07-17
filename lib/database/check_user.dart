import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatelessWidget {

  final String documentId;

  final String name;


  CheckUser(this.documentId, this.name);

  @override
  Widget build(BuildContext context) {

    CollectionReference checkuser= FirebaseFirestore.instance.collection('Users');
    var check=0;

    return FutureBuilder<DocumentSnapshot>
      (future : checkuser.doc(documentId).get(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as
          Map<String,dynamic>;
          if('indra'==name)
            check = 1 ;
          return Text('$check');
        };
        return Text('Loading ....',textAlign: TextAlign.center,);
      },
    );
  }
}
