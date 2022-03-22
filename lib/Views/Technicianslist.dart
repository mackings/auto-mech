import 'package:auto_mech/Views/Mapscreen.dart';
import 'package:auto_mech/Widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:direct_dialer/direct_dialer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_mech/Database Models/databasemodel.dart';
import 'package:auto_mech/Database Models/Techniciansmodel.dart';
import 'package:auto_mech/Auths/authentications.dart';

class Technicianslist extends StatefulWidget {
  const Technicianslist({Key? key}) : super(key: key);

  @override
  State<Technicianslist> createState() => _TechnicianslistState();
}

class _TechnicianslistState extends State<Technicianslist> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        
          body: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Technicians').snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.docs.length == 0) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff35c343),
                    ));
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        Tech tecnics = Tech.fromJson(snapshot.data.docs[index]);
                        return Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            'Are you sure you want to Call ${tecnics.name}?',
                                            style:
                                                TextStyle(fontFamily: 'candal'),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                'Yes',
                                                style: TextStyle(
                                                    fontFamily: 'candal'),
                                              ),
                                              onPressed: () {
                                                mailTechnician();
                                                Navigator.pop(context);
                                                showDialog(context: context, builder: (context) {
                                                  return AlertDialog(
                                                    title: Text('Locating... ${tecnics.name}',style: TextStyle(fontFamily: 'candal'),),
                                                    content: Text('${tecnics.name}s Team Would reach You Soon',style: TextStyle(fontFamily: 'candal'),),
                                                    actions: [
                                                      FlatButton(
                                                        child: Text('Results',style: TextStyle(fontFamily: 'candal'),),
                                                        onPressed: () {
                                                         Navigator.push(context, MaterialPageRoute(builder: (context) => Mapscreen()));
                                                        },
                                                      )
                                                    ],
                                                    
                                                  );
                                                  
                                                });
                                              },
                                            ),
                                            FlatButton(
                                              child: Text(
                                                'No',
                                                style: TextStyle(
                                                    fontFamily: 'candal'),
                                              ),
                                              onPressed: () {
                                                
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Container(
                                  height: 130,
                                  width: MediaQuery.of(context).size.width - 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xff35c343),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 90,
                                        child: Image.asset('assets/Man2.png'),
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text('Name: ${tecnics.name}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'candal',
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text('Mail:${tecnics.email}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'candal',
                                                    color: Colors.white)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                                'Phone: ${tecnics.phone}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'candal',
                                                    color: Colors.white)),
                                          ),
                                          Text('Location: ${tecnics.location}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'candal',
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data.docs.length,
                    );
                  }
                }
                return CircularProgressIndicator();
              })),
    );
  }
}
