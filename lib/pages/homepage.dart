import 'package:flutter/material.dart';
import 'package:my_project1/main.dart';

class homepage extends StatelessWidget {

  var number = 321;
  String str = "anu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Catalog app"),
      ),
      body: Center(
          child: Container(
              child: Text("Hello World ! number=$number "),
      )),
      drawer: Drawer(),
    );
  }
}
