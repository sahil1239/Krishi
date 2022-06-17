import 'package:flutter/material.dart';
import 'roundedbutton.dart';
import 'login.dart';
import 'signup.dart';

class Landingpage extends StatefulWidget {
  static String id = 'screen';
  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/farming.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Roundedbutton(
                    'LOGIN',
                    () {
                      Navigator.pushNamed(context, Login.id);
                    },
                    Colors.white,
                    Colors.black,
                  ),
                  Roundedbutton(
                    'REGISTER',
                    () {
                      Navigator.pushNamed(context, SignUP.id);
                    },
                    Colors.white,
                    Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
