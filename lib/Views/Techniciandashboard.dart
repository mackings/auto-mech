import 'dart:ui';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path/path.dart';

import 'package:auto_mech/Views/TechnicianReg.dart';
import 'package:auto_mech/Views/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TechDashboard extends StatefulWidget {
  const TechDashboard({Key? key}) : super(key: key);

  @override
  State<TechDashboard> createState() => _TechDashboardState();
}

class userpro {
  String? name;
  String? Status;

  userpro(this.name, this.Status);

  factory userpro.fromDocument(DocumentSnapshot snapshot) {
    return userpro(snapshot['name'], snapshot['Status']);
  }
}

class _TechDashboardState extends State<TechDashboard> {
  File? _selectedImage;
  final picker = ImagePicker();

  late String imageLink;

  //final userId = FirebaseAuth.instance.currentUser!.uid;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Uploadimagetodb() async {
    FirebaseStorage fs = FirebaseStorage.instance;
    final reference = fs.ref();
    final picturefolder = reference.child("Transaction Shots").child("Cards");
    UploadTask uploadTask = picturefolder.putFile(_selectedImage!);
    await uploadTask.then((p0) => p0.ref.getDownloadURL().then((p1) {
          imageLink = p1.toString();
          print(imageLink);
        }));
    picturefolder.putFile(_selectedImage!).whenComplete(() => () async {
          var imageLink = await picturefolder.getDownloadURL();
          print(imageLink);
        });
  }

  final Store = FirebaseFirestore.instance;

  Future Getuserprofile() async {
    await Store.collection("Waitlist")
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get()
        .then((value) {
      print(value.data());
    });
  }

  final Useremail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Center(
            child: Text(
          'Welcome',
          style: TextStyle(fontSize: 20, fontFamily: 'candal'),
        )),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Getuserprofile();
          },
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: Color(0xff35c343),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Account Status',
                  style: TextStyle(
                      fontSize: 20, fontFamily: 'candal', color: Colors.white),
                )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Email:$Useremail',
                      style: TextStyle(fontSize: 15, fontFamily: 'candal'),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '',
                      style: TextStyle(fontSize: 20, fontFamily: 'candal'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Account Status:',
                      style: TextStyle(fontSize: 15, fontFamily: 'candal'),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'Approved',
                      style: TextStyle(fontSize: 15, fontFamily: 'candal'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Color(0xff35c343),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(_selectedImage == null
                          ? File('assets/Man1.png')
                          : File(_selectedImage!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    ' Upload Image',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'candal',
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage();
                      Uploadimagetodb();
                    },
                    child: Icon(
                      Icons.image,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: Color(0xff35c343),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text('No Orders yet', style: TextStyle(fontFamily: 'candal'),)),
        ),
      ]),
    ));
  }
}
