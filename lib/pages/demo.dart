import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand ,
        children: [
          Scrollbar(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 400),
                    scrollDirection: Axis.horizontal,
                    children :[
                      Row(
                        children: [
                          Container(
                            child: Icon(Icons.headphones,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.wrong_location,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.headphones,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.wrong_location,size: 80),
                          ),            Container(
                            child: Icon(Icons.headphones,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.wrong_location,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.headphones,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.wrong_location,size: 80),
                          ),
                          Container(
                            child: Icon(Icons.headphones,size: 80),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 50,
                    children: [
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),
                      GridTile(
                        child: Container(
                          child: Icon(Icons.wrong_location,size: 80),
                        ),
                      ),



                    ],

                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
