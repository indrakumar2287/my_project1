import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/database/check_user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Authentication/authentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FirebaseFirestore db=FirebaseFirestore.instance;

  CheckData(String email,String password) {
    String password4,email4;

    db.collection("Users").where("Name", isEqualTo: true).get().then(
          (res) => {

          },
      onError: (e) => print("Error completing: $e"),
    );
  }
  bool _securetext=true;
  var _formkey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/image3.jpg"), fit: BoxFit.cover)),
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
              padding: EdgeInsets.only(left: 100, top: 110,right: 100),
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
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    Form(
                      key: _formkey,
                      child : Column(
                      children:[
                        TextFormField(
                        validator: (String? value){
                          if(value!.length < 10)
                            return "Email Is Necessary";
                          else
                            return null;
                        },
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                            errorText: _emailError,
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (String? value){
                            if(value!.length < 10)
                              return "Enter at least 10 char";
                            else
                              return null;
                          },
                          controller: password,
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
                            //  if(email.text=='x')   Navigator.pushNamed(context, 'home',arguments: email.text);

                              setState(() {
                                // String check = CheckUser(docIds[index],email.text) as String;
                                if(email.text.length<8 || password.text.length < 8){
                                if(email.text.length < 8)
                                  _emailError = "Invalid Email";
                                else {
                                  _emailError = null;
                                };
                                if(password.text.length < 8)
                                  _passwordError = "Enter at least 8 char";
                                else {
                                  _passwordError = null;
                                };}
                                else{
                                  // Navigator.pushNamed(context, 'home',arguments: email.text);
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(mail: email.text,)));
                                  String email2 = email.text.trim();
                                  String password2 = password.text;
                                  CreateUser(email: email2, password: password2);

                                  void getName() async {
                                    final pref = await SharedPreferences.getInstance();
                                    pref.setString('Name2', email2);
                                  }
                                  getName();
                                };
                              });
                            }, ),
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
                            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          child: Text("Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff4c505b)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                              foregroundColor: MaterialStateProperty.all(Colors.black)
                          ),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
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



  Future CreateUser({required String email, required String password}) async {
    ///Reference to document
    final DocUser = FirebaseFirestore.instance.collection('Logins').doc();
    final json = {
      'Name': email,
      'Password': password,
    };
    /// Create Document and write data to Firebase
    await DocUser.set(json);
  }

}
