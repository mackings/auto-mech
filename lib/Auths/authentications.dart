import 'dart:convert';

import 'dart:ui';

import 'package:auto_mech/Views/Signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:direct_dialer/direct_dialer.dart';
import 'package:auto_mech/Database Models/Techniciansmodel.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

//Registration controllers
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController phonePasswordController = TextEditingController();

//login controllers
TextEditingController emailloginController = TextEditingController();
TextEditingController passwordloginController = TextEditingController();
final Usermail = FirebaseAuth.instance.currentUser;



final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

final Snacks = SnackBar(
  content: Text('This is a SnackBar'),
  backgroundColor: Colors.blue,
);



//Sending Emails to Admin

final emailurl = 'https://easymail.p.rapidapi.com/send';

Future mailTechnician() async {
  var response = await http.post(Uri.parse(emailurl),
      headers: {
        'content-type': 'application/json',
        'x-rapidapi-host': 'easymail.p.rapidapi.com',
        'x-rapidapi-key': 'ec638319d1msh9464f65db7de373p1c26a9jsnee9a515c9b14'
      },
      //body
      body: jsonEncode({
        "from": "Admin@FastRepair",
        "to": 'kingsleyudoma2018@gmail.com',
        "subject": "Repair Request",
        "message": "<h1>A user ${Usermail!.email} has requested a Repair</h1>"
      }));

  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    print('Admin Notified Successfully');

    print(result);
  } else {
    print(response.statusCode);
  }
}
