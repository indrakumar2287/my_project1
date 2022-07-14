import 'package:flutter/material.dart';
import 'package:my_project1/pages/signup_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'database.dart';
class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: StreamBuilder<List<database>>(
        stream: ReadUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError){
            return Text('something went Wrong');
          }
          else if(snapshot.hasData){
            final New_Users=snapshot.data!;
            return ListView(
              children: New_Users.map(buildUser).toList(),
            );
          }
          else return Center(child: CircularProgressIndicator());
        },
      ),

    );
  }
  Widget buildUser(database user) => ListTile(
    leading: Text('1'),
    // title: Text(user.email),
    // subtitle: Text(user.password),
  );

  Stream<List<database>> ReadUsers() =>
      FirebaseFirestore.instance.collection('New_Users')
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => database.fromJson(doc.data())).toList());


}
