import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project1/database/check_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _securetext=true;
  var _formkey = GlobalKey<FormState>();
  String? _emailError;
  String? _passwordError;

  List<String> docIds =[];

  //Get IDs
  Future getIds() async {
    await FirebaseFirestore.instance.collection('Users').get().
    then((snapshot) => snapshot.docs.forEach((document) {
      // print(document.reference);
      docIds.add(document.reference.id);
    })
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 100, top: 130),
              child: Text(
                "Welcome \nBack",
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
                    top: MediaQuery.of(context).size.height * 0.5,
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
                            labelText: 'Email',
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
                            labelText: 'Password',
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
                            height: 40,
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
                            color: Color(0xff4c505b),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                            onPressed: () {
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
                                  Navigator.pushNamed(context, 'home');
                                  final name2 = email.text;
                                  final password2 = password.text;
                                  CreateUser(email: name2, password: password2);
                                };
                              });
                            }, ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Color(0xff4c505b)),
                          ),
                        ),
                        ElevatedButton(
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
