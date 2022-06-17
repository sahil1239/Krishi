import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'roundedbutton.dart';
import 'coordinates.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'package:geolocator/geolocator.dart';
class GPS extends StatefulWidget {
  static String id = 'gps';
  @override
  State<GPS> createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  double? lat;
  double? long;
  bool load=true;
  @override
  void initState() {
    super.initState();
    getlocation();
  }

  void getlocation() async {
    Location loc = Location();
    var lst = await loc.getcurrentlocation();
    setState(() {
      lat=lst[0];
      long=lst[1];
      load=false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        opacity: 0.3,
        inAsyncCall: load,
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'GeomapperGPSActivity',
                        style: GoogleFonts.raleway(
                            textStyle: kheading.copyWith(fontSize: 25)),
                      ),
                    ),
                  ],
                ),
              ),
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/farming.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Latitude:  $lat',
              style: ktextstyle,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Longitude:  $long',
              style: ktextstyle,
            ),
          ],
        ),
      )
    );
  }
}
