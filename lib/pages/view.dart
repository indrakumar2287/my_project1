import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Scrollbar(
        trackVisibility: true,
        thickness: 10,
        thumbVisibility: true,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 400),
                scrollDirection: Axis.vertical,
                children :[
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
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
                                )
                              // ],
                            // ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
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
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                          Icon(Icons.create,size: 70,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
