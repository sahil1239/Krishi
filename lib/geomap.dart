import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'roundedbutton.dart';
import 'gps.dart';
// import 'package:carpool/network.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Geomap extends StatefulWidget {
  static String id = 'geomap';
  @override
  _GeomapState createState() => _GeomapState();
}

class _GeomapState extends State<Geomap> {
  @override
  String? samplename;
  String? sampledesc;
  String? chosenValue;
  bool load = false;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: _formKey,
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
                      SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'GeomapperActivity',
                          style: GoogleFonts.raleway(
                              textStyle: kheading.copyWith(fontSize: 30)),
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
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    InputDecorator(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6)) )
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isDense: true,
                          value: chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),
                          items: <String>[
                            'Android',
                            'IOS',
                            'Flutter',
                            'Node',
                            'Java',
                            'Python',
                            'PHP',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text(
                            "Please choose a langauage",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          onChanged: (String? value) {
                            setState(() {
                              chosenValue = value;
                            });
                          },
                          isExpanded: true,
                          //alignment: Alignment.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      decoration:
                      kdecoration.copyWith(hintText: 'Enter Sample Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sample Name Can\'t Be Null';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          samplename = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: null,
                      decoration:
                      kdecoration.copyWith(
                        hintText: 'Enter Sample Description',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Sample Description Can\'t Be Null';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          sampledesc = value;
                        });
                      },
                    ),
                    Roundedbutton('Next', () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, GPS.id);
                        // Network net1 = Network(
                        //     'https://carpoolv2.herokuapp.com/user/signup');
                        // setState(() {
                        //   load = true;
                        // });
                        // int num = await net1.signup(
                        //     fullname, pno, address, email, password, DL);
                        // setState(() {
                        //   load = false;
                        // });
                        // if (num == 1) {
                        //   Navigator.pushNamed(context, Login.id);
                        // } else if (num == 2) {
                        //   Fluttertoast.showToast(
                        //     msg: 'Email Already exists',
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     backgroundColor: Colors.grey.shade700,
                        //     textColor: Colors.white,
                        //     fontSize: 15,
                        //   );
                        // } else if (num == 3) {
                        //   Fluttertoast.showToast(
                        //     msg: 'Try Again',
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     backgroundColor: Colors.grey.shade700,
                        //     textColor: Colors.white,
                        //     fontSize: 15,
                        //   );
                        //}
                      }
                    }, Colors.black, Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}