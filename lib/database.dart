import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class database{
String id;
final String name;
final String email;
final String password;
final String number;

database({
  this.id='',
  required this.name,
  required this.email,
  required this.password,
  required this.number}
    );

Map<String, dynamic> toJson() => {
  'id':id,
  'name':name,
  'email':email,
  'password':password,
  'number':number
  };

  static database fromJson(Map<String, dynamic> json) => database(
    id: json['id'],
    name: json['name'],
    email :json['email'],
    password : json['password'],
    number: json ['number']

  );


}

