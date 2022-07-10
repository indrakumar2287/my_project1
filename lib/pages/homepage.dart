import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  var number = 321;
  String str = "anu";

  Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog app"),
      ),
      body: Center(
          child: Container(
        child: const Text(" Home Page \ n\n!! RAM RAM !! "),
      )),
      drawer: const Drawer(),
    );
  }
}
