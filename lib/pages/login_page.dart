import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/database/check_user.dart';
import 'package:my_project1/main.dart';
import 'package:my_project1/pages/homepage2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  bool _securetext = true;
  var _formkey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image3.jpg"),
                      fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 100, top: 110, right: 100),
                      child: Text(
                        "Welcome \nBack",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Font3',
                            color: Colors.white,
                            fontSize: 45,
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
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email),
                                        errorText: _emailError,
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        hintText: 'Email',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10))),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextFormField(
                                    controller: passwordController,
                                    obscureText: _securetext,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.key),
                                      errorText: _passwordError,
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: 'Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(_securetext
                                            ? Icons.remove_red_eye
                                            : Icons.security),
                                        onPressed: () {
                                          setState(() {
                                            _securetext = !_securetext;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                      icon: Icon(Icons.arrow_forward),
                                      color: Colors.black,
                                      onPressed: () {
                                        if (emailController.text.length < 8 ||
                                            passwordController.text.length <
                                                8) {
                                          if (emailController.text.length < 8)
                                            _emailError = "Invalid Email";
                                          else {
                                            _emailError = null;
                                          };
                                          if (passwordController.text.length <
                                              8)
                                            _passwordError =
                                            "Enter at least 8 char";
                                          else {
                                            _passwordError = null;
                                          };
                                        }
                                        else {
                                          String email2 = emailController.text;
                                          String password2 = passwordController.text;
                                          // Navigator.pushNamed(context, 'home');
                                          SignIn();
                                          print('Done \n +++++++++++++++++++++++++++++++++++++');
                                          void getName() async {
                                            final pref = await SharedPreferences.getInstance();
                                            pref.setString('Name2', email2);
                                          };
                                          getName();
                                        }
                                      }
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'signup');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.lightGreenAccent),
                                    foregroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff4c505b)),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.lightGreenAccent),
                                      foregroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff4c505b)),
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


    Future SignIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        print(e);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

}
