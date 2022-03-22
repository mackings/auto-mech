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
        body: GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 15),)
          ),
      
    );
  }
}
