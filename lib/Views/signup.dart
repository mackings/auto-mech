import 'dart:ui';

import 'package:auto_mech/Database%20Models/databasemodel.dart';
import 'package:auto_mech/Views/Home.dart';
import 'package:auto_mech/Views/Signin.dart';
import 'package:auto_mech/Auths/authentications.dart';
import 'package:auto_mech/Views/TechnicianReg.dart';
import 'package:auto_mech/Widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {


  RegisterUser() {

  FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
      .then((user) { 
        if (user != null) {
          Fluttertoast.showToast(
              msg: "User Created Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Signin()));
        } else {
          Fluttertoast.showToast(
              msg: "User Creation Failed",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }).catchError((e) => showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error",style: TextStyle(fontFamily: 'candal'),),
              content: Text(e.message,style: TextStyle(fontFamily: 'candal'),),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK",style: TextStyle(fontFamily: 'candal'),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }));
}


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 89,
              bottom: 33,
            ),
            child: Column(
              children: [
                Center(
                  child: Center(
                    child: Text(
                      "Create a new Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Candal",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Create a new account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "Candal",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 101,
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 24,
                    top: 22,
                    bottom: 11,
                  ),
                  child: Container(
                      width: 311,
                      height: 68,
                      color: Color(0xff35c343),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: usernameController,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'candal',
                                fontSize: 20),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 3) {
                                return 'Please enter a Username';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Username',
                              suffixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Candal',
                                  fontWeight: FontWeight.w500),
                              contentPadding:
                                  EdgeInsets.only(top: 14, left: 20),
                              border: InputBorder.none,
                            ),
                          ))),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 65,
                  child: Container(
                      width: 311,
                      height: 68,
                      color: Color(0xff35c343),
                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'candal',
                            fontSize: 20),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Candal',
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.only(top: 14, left: 20),
                          border: InputBorder.none,
                        ),
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 97,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 50,
                          height: 69,
                          color: Color(0xff35c343),
                          child: TextFormField(
                            controller: phonePasswordController,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'candal',
                                fontSize: 20),
                            validator: (value) {
                              if (value!.isEmpty || value.length < 11) {
                                return 'Please enter a Valid Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Phone Nunber',
                              suffixIcon: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Candal',
                                  fontWeight: FontWeight.w500),
                              contentPadding:
                                  EdgeInsets.only(top: 14, left: 20),
                              border: InputBorder.none,
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 71,
                  child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 69,
                      color: Color(0xff35c343),
                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'candal',
                            fontSize: 20),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Please enter a Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Candal',
                              fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.only(top: 14, left: 20),
                          border: InputBorder.none,
                        ),
                      )),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "How do we Classify You ?",
                                style: TextStyle(
                                  fontFamily: 'candal',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              content: Text(
                                "Please select a Registration Type",
                                style: TextStyle(
                                  fontFamily: 'candal',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  child: Text(
                                    "Technician",
                                    style: TextStyle(
                                      fontFamily: 'candal',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>TechReg()));
                                  },
                                ),
                                FlatButton(
                                  child: Text(
                                    "Customer",
                                    style: TextStyle(
                                      fontFamily: 'candal',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onPressed: () {
                                    RegisterUser();
                                    Addusertodb();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signin()));
                                  },
                                ),
                              ],
                            );
                          });
                      //RegisterUser();
                      //Addusertodb();
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  "Error",
                                  style: TextStyle(fontFamily: 'candal'),
                                ),
                                content: Text(
                                  "Please fill all the fields",
                                  style: TextStyle(fontFamily: 'candal'),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text(
                                      "Close",
                                      style: TextStyle(fontFamily: 'candal'),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 64,
                    child: Container(
                      width: 311,
                      height: 69,
                      color: Color(0xff35c343),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Candal",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signin()));
                  },
                  child: Text(
                    "Existing User ? Login ",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Candal",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
