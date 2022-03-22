import 'package:auto_mech/Views/Technicianslist.dart';
import 'package:auto_mech/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_mech/Database Models/databasemodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Mapscreen extends StatefulWidget {
  const Mapscreen({Key? key}) : super(key: key);

  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final Geolocator geolocator = Geolocator();
  late Position _currentPosition;
  late String _currentAddress;

  Viewlocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      forceAndroidLocationManager: true,
      timeLimit: Duration(seconds: 10),
    );
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: GestureDetector(
              onTap: () {
                Viewlocation();
              },
              child: Center(child: Text('Hello'))),
        ),
      ),
    );
  }
}
