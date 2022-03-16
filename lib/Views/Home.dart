
import 'package:auto_mech/Views/Technicianslist.dart';
import 'package:auto_mech/Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auto_mech/Database Models/databasemodel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height,
            color: Colors.white,

            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    Text(
                      "Flutter",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 4.83),
                Container(
                  width: 360,
                  height: 222,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 15,
                        top: 15,
                        child: Text(
                          "Hi Folagade",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "candal",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 60,
                        child: SizedBox(
                          width: 221,
                          height: 61,
                          child: Text(
                            "What Service do\n you need ?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "candal",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 120,
                            height: 156,
                            child: Icon(
                              Icons.settings,
                              size: 130,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        top: 161,
                        child: Container(
                          width: 204,
                          height: 61,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff35c343),
                          ),
                          padding: const EdgeInsets.only(
                            left: 18,
                            right: 39,
                            top: 20,
                            bottom: 19,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Technicianslist()));
                                },
                                child: Text(
                                  "Find Technicians",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "candal",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.83),

                //service categories

                Container(
                  width: 360,
                  height: 173,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "  What we do",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "candal",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.83),
                      Positioned(
                        left: 13,
                        top: 30,
                        child: Container(
                          width: 87,
                          height: 112,
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 4,
                            top: 13,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 75,
                                height: 69,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff35c343),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Repair",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: "candal",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21,
                        top: 58,
                        child: Container(
                          width: 80,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/spanner.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 87,
                            height: 126,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 6,
                                  top: 21,
                                  child: Container(
                                    width: 75,
                                    height: 69,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff35c343),
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Replace",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "candal",
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 16,
                                  top: 25,
                                  child: Container(
                                    width: 53,
                                    height: 65,
                                    child: Image.asset(
                                      "assets/Wheel.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 257,
                        top: 24,
                        child: Container(
                          width: 93,
                          height: 118,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 1,
                                top: 15,
                                child: Container(
                                  width: 75,
                                  height: 69,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff35c343),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 13,
                                top: 29,
                                child: Container(
                                  width: 52,
                                  height: 41,
                                  child: Image.asset(
                                    "assets/Carservice.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Maintain",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontFamily: "candal",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.83),

                SizedBox(height: 4.83),

                SizedBox(height: 4.83),
                Container(
                  width: 360,
                  height: 130,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 330,
                            height: 104,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff35c343),
                            ),
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 221,
                            ),
                            child: Container(
                              width: 99,
                              height: 90,
                              child: Image.asset(
                                "assets/Man1.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 124,
                        top: 12,
                        child: Container(
                          width: 208,
                          height: 120,
                          padding: const EdgeInsets.only(
                            right: 14,
                            top: 16,
                            bottom: 27,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : Ahmed Musa",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "candal",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "Status : Verified",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "candal",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "Location : Challenge",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "candal",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.83),
                Container(
                  width: 350,
                  height: 125,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 300,
                    height: 104,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff35c343),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 90,
                          height: 78,
                          child: Image.asset(
                            "assets/Man2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Name : Ayo Bamidele\nStatus : Verified\nLocation : Mokola",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "candal",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget SuccessDialog(BuildContext context, String message) {
  return Container(
      height: MediaQuery.of(context).size.height - 400,
      width: MediaQuery.of(context).size.width - 10,
      child: Column(
        children: <Widget>[
          const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Thank you for your order",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width - 10,
            child: Center(
              child: Text(
                "We will contact you soon",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width - 10,
            child: Center(
              child: Text(
                "Thank you for shopping with us",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ));
}
