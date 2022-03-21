import 'dart:ui';

import 'package:auto_mech/Views/TechnicianReg.dart';
import 'package:auto_mech/Views/signup.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            
            children: [
              SizedBox(
                height: 190,
              ),

              Center(
                child: Text('Welcome',
                    style: TextStyle(
                        fontFamily: 'candal',
                        fontSize: 40,
                        color: Colors.black)),
              ),

              Center(
                child: Text('Register as ',
                    style: TextStyle(
                        fontFamily: 'candal',
                        fontSize: 40,
                        color: Colors.black)),
              ),

              SizedBox(
                height: 40,
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Container(
                  height: 70,
                  width:MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color:  Color(0xff35c343),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Customer', style: TextStyle(fontFamily: 'candal',color: Colors.white),)),
              
                ),
              ),

              SizedBox(
                height: 40,
              ),



              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TechReg()));
                },
                child: Container(
                  height: 70,
                  width:MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    color:  Color(0xff35c343),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Technician', style: TextStyle(fontFamily: 'candal',color: Colors.white),)),
              
                ),
              ),


              SizedBox(height: 30,),


              Center(child: Text('Skip',style: TextStyle(fontFamily: 'candal',fontSize: 20),)),
              

            ],
          ),
        )
      ),
    );
  }
}