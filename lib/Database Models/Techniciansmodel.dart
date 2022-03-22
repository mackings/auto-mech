import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tech {
  String name;
  String email;
  String phone;
  String location;
  String Specifications;


  Tech({required this.name, required this.email, required this.phone , required this.location, required this.Specifications});

  factory Tech.fromJson(DocumentSnapshot snapshot) {
    return Tech(
      name: snapshot['Username'],
      email: snapshot['email'],
      phone: snapshot['Phone Number'],
      location: snapshot['location'],
      Specifications: snapshot['Specifications'],
      
    );
  }
}
