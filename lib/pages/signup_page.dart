import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/register.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 100),
              child: Text(
                "Create  \nAccount",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 33,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery
                        .of(context)
                        .size
                        .height * 0.4,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                  TextField(
                  controller: name,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Mobile Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xff4c505b),
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xff4c505b),
                    child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          final name3=name.text;
                          final password3=password.text;
                          CreateUser(name: name3, password: password3);
                          Navigator.pushNamed(context, 'home');
                        },
                    icon: Icon(Icons.arrow_forward),
              ),
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    color: Color(0xff4c505b)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    color: Color(0xff4c505b)),
              ),
            ),
          ],
        )
        ],
      ),
    ),
    )
    ],
    ),
    ),
    );
    }

  Future CreateUser({required String name, required String password}) async {
    ///Reference to document
    final docuser = FirebaseFirestore.instance.collection('user_registers').doc();
    final json = {
      'name': name,
      'password': password,
    };

    /// Create Document and write data to Firebase
    await docuser.set(json);
  }
}
