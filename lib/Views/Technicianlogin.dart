import 'package:auto_mech/Views/Home.dart';
import 'package:auto_mech/Views/Techniciandashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_mech/Auths/authentications.dart';

class TechLogin extends StatefulWidget {
  const TechLogin({Key? key}) : super(key: key);

  @override
  State<TechLogin> createState() => _TechLoginState();
}

class _TechLoginState extends State<TechLogin> {


  LogUserin() {
  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailloginController.text.trim(),
    password: passwordloginController.text.trim(),
  ).then(( user) {
    if (user != null){
      
       Navigator.push(context, MaterialPageRoute(builder: (context) => TechDashboard()));
    } else {

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
          body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 150),
                Center(
                  child: Text(
                    "Welcome Technician",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: "candal",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: 329,
                  height: 66,
                  padding: const EdgeInsets.only(
                    bottom: 49,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign In to Continue",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: "candal",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 63,
                  child: Container(
                      width: 311,
                      height: 68,
                      color: Color(0xff35c343),
                      child: TextFormField(
                        controller: emailloginController,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'candal',
                            fontSize: 20),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Please enter Valid Email';
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
                SizedBox(height: 12),
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "candal",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 63,
                  child: Container(
                      width: 311,
                      height: 68,
                      color: Color(0xff35c343),
                      child: TextFormField(
                        controller: passwordloginController,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'candal',
                            fontSize: 20),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Please enter a Valid Password';
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
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "candal",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 120),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xff35c343),
                        fontSize: 14,
                        fontFamily: "candal",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      LogUserin();

                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Error"),
                                content: Text(
                                  "Please enter valid email and password",
                                  style: TextStyle(fontFamily: 'candal'),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text(
                                      "OK",
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
                    height: 69,
                    child: Container(
                      width: 311,
                      height: 68,
                      color: Color(0xff35c343),
                      padding: const EdgeInsets.only(
                        left: 120,
                        right: 125,
                        top: 19,
                        bottom: 20,
                      ),
                      child: Center(
                        child: Text(
                          "Login ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "candal",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
