import 'dart:async';


import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:miasuperadmin/Bindings/Set%20Routes/set_routes.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.toNamed(homescreen));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: AssetImage('assets/splashpic.png'),
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.305,
              left: MediaQuery.of(context).size.width * 0.07,
              // bottom: MediaQuery.of(context).size.
            ),
            child: ListView(
              children: [
                Center(
                  child: Image.asset(
                    'assets/Logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Mia Group',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Viga',
                  ),
                  
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'Mia Group Of Compaines',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'inter',
                      color: Color(0xff09051C)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}