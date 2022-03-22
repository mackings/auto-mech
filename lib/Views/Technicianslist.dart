import 'package:auto_mech/Views/Mapscreen.dart';
import 'package:auto_mech/Widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:direct_dialer/direct_dialer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_mech/Database Models/databasemodel.dart';
import 'package:auto_mech/Database Models/Techniciansmodel.dart';
import 'package:auto_mech/Auths/authentications.dart';
import 'package:geolocator/geolocator.dart';

class Technicianslist extends StatefulWidget {
  const Technicianslist({Key? key}) : super(key: key);

  @override
  State<Technicianslist> createState() => _TechnicianslistState();
}

class _TechnicianslistState extends State<Technicianslist> {
  final Geolocator geolocator = Geolocator();
  Position? _currentPosition;
  LocationPermission? permission;
  late String _currentAddress;
  bool _serviceenabled = false;

  Viewlocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      forceAndroidLocationManager: true,
      timeLimit: Duration(seconds: 20),
    );
    setState(() {
      _currentPosition = position;
    });

    _serviceenabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {}

    print(position);

    //final address = await Geocoder.local.findAddressesFromCoordinates(
    //   Coordinates(position.latitude, position.longitude));

    //var first = address.first;
    ////print(first.locality);
    //print(first.adminArea);
  }

  reqpermission() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Technicians')
                  .snapshots(),
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
                                            'Connect with ${tecnics.name}?',
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
                                                reqpermission();
                                                Navigator.pop(context);
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                          'Locating... ${tecnics.name}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'candal'),
                                                        ),
                                                        content: Text(
                                                          '${tecnics.name} is being Contacted',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'candal'),
                                                        ),
                                                        actions: [
                                                          FlatButton(
                                                            child: Text(
                                                              'Movements',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'candal'),
                                                            ),
                                                            onPressed: () {
                                                              mailTechnician();
                                                              
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Mapscreen()));
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
                                              onPressed: () {},
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: Container(
                                  height: 150,
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
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                'Specification: ${tecnics.Specifications}',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'candal',
                                                    color: Colors.white)),
                                          ),
                                          Text('Location: Fcah IB',
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
