import 'package:flutter/material.dart';
import 'landingpage.dart';
import 'login.dart';
import 'signup.dart';
import 'geomap.dart';
import 'gps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Landingpage.id: (context) => Landingpage(),
        Login.id: (context) => Login(),
        Geomap.id: (context) => Geomap(),
        SignUP.id: (context) => SignUP(),
        GPS.id: (context) => GPS(),
      },
      initialRoute: Landingpage.id,
    );
  }
}
