// import 'package:flutter/material.dart';
// import 'package:passcode_screen/passcode_screen.dart';
// import 'package:my_project1/database/passcode.dart';
//
//
// class PassCode extends StatefulWidget {
//   const PassCode({Key? key}) : super(key: key);
//
//   @override
//   State<PassCode> createState() => _PassCodeState();
// }
//
// class _PassCodeState extends State<PassCode> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Lock Screen'),
//          ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.red),
//                   foregroundColor: MaterialStateProperty.all(Colors.black),
//                 ),
//                   onPressed: (){
//                   // screenLock(
//                   //   context: context,
//                   //   correctString : '1234',
//                   //   canCancel : false
//                   // );
//                   },
//                   child: Text('Lock')),
//             ],
//           ),
//         ),
//         ),
//     );
//   }
// }
