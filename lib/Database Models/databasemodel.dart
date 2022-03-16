import 'dart:core';

import 'package:auto_mech/Auths/authentications.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_mech/Views/TechnicianReg.dart';

final dbref = FirebaseDatabase.instance.reference();

class mechs {
  String? email;
  String? phone;

  mechs({this.email, this.phone});
}

Future Addusertodb() async {
  await FirebaseFirestore.instance.collection('Users').doc().set({
    'Username': usernameController.text.trim(),
    'email': emailController.text.trim(),
    'password': passwordController.text.trim(),
    'Phone Number': phonePasswordController.text.trim(),
  }).whenComplete(() => print('Data Added'));
}







Future Getusersfromdb() async {
  await FirebaseFirestore.instance.collection('Users').get().then((value) {
  value.docs.forEach((element) {
     print(element.data());
     print(element.data()['Username']);
     print(element.data()['email']);
    print(element.data()['password']);
      print(element.data()['Phone Number']);

      
   });
   


   return ListView(
     children: value.docs.map((doc) => ListTile(
       title: Text(doc.data()['Username']),
       subtitle: Text(doc.data()['email']),
       trailing: Text(doc.data()['password']),
     )).toList(),
   );
  
   
  });

 
  
}

dynamic meka;






