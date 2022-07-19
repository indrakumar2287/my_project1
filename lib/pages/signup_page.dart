import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final number = TextEditingController();
  final password = TextEditingController();

  bool _securetext=true;
  var _formkey = GlobalKey<FormState>();
  String? _nameError;
  String? _emailError;
  String? _mobilenumberError;
  String? _passwordError;

  final docuser = FirebaseFirestore.instance.collection('Users').doc();


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/image3.jpg"),
              fit: BoxFit.cover)
      ),
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
              padding: EdgeInsets.only(left: 100, top: 100),
              child: Text(
                "Create  \nAccount",
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
                        .height * 0.35,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          errorText: _nameError,
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                          errorText: _emailError,
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
                    TextFormField(
                      controller: number,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 11),
                          child: Text('+91',style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                        ),
                          // prefixText: '+91 ',
                          prefixStyle: TextStyle(color: Colors.black87),
                          errorText: _mobilenumberError,
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
                    TextFormField(
                      controller: password,
                      obscureText: _securetext,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.security),
                          suffixIcon: IconButton(
                            icon: Icon(_securetext
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _securetext = !_securetext;
                              });
                            },
                          ),
                          errorText: _passwordError,
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
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                // String check = CheckUser(docIds[index],email.text) as String;
                                if(email.text.length<8 || password.text.length < 8 || name.text.length < 1 || double.tryParse(number.text) == null || number.text.length < 10){
                                  if(name.text.length < 1)
                                    _nameError = "Name can't be blank";
                                  else {
                                    _nameError = null;
                                  };
                                  if(email.text.length < 8)
                                    _emailError = "Invalid Email";
                                  else {
                                    _emailError = null;
                                  };
                                  if(double.tryParse(number.text) == null || number.text.length < 10 )
                                    _mobilenumberError = "Please enter a valid Mobile Number";
                                  else {
                                    _mobilenumberError = null;
                                  };
                                  if(password.text.length < 8)
                                    _passwordError = "Enter at least 8 characters";
                                  else {
                                    _passwordError = null;
                                  };}
                                else{
                                  Navigator.pushNamed(context, 'home');
                                  final name3 = name.text;
                                  final email3 = email.text;
                                  final number3 = number.text;
                                  final password3 = password.text;
                                  CreateUser(
                                      name: name3,
                                      password: password3,
                                      email: email3,
                                      number: number3);
                                };
                              });
                              },
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff4c505b)),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
                            foregroundColor: MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {},
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

  Future CreateUser({required String name,
    required String password,
    required String email,
    required String number}) async {
    ///Reference to document

    final json = {
      'Name': name,
      'Email': email,
      'Mobile Number': number,
      'Password': password,
    };

    Map<String, dynamic> toJson() =>
        {
          'Name': name,
          'Email': email,
          'Mobile Number': number,
          'Password': password,
        };

    // database db1=database(name,email,password,number);
    /// Create Document and write data to Firebase
    await docuser.set(json);
  }

  // Widget buildUser(database user) => ListTile(
  //   leading: Text(user.name),
  //   title: Text(user.email),
  //   subtitle: Text(user.password),
  // );
  //
  //   Stream<List<database>> ReadUsers() =>
  //       FirebaseFirestore.instance.collection('New_Users')
  //           .snapshots()
  //           .map((snapshot) =>
  //           snapshot.docs.map((doc) => database.fromJson(doc.data())).toList());

}