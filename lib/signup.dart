import 'login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'roundedbutton.dart';
// import 'package:carpool/network.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUP extends StatefulWidget {
  static String id = 'signup';
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  String? firstname;
  String? lastname;
  String? fullname;
  String? pno;
  String? password;
  bool _passwordVisible=false;
  bool load = false;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        opacity: 0.3,
        inAsyncCall: load,
        child: SingleChildScrollView(
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
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Register',
                            style: GoogleFonts.raleway(
                                textStyle: kheading.copyWith(fontSize: 50)),
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
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration:
                        kdecoration.copyWith(hintText: 'Enter First Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First Name Can\'t Be Null';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            firstname = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.left,
                        decoration:
                        kdecoration.copyWith(hintText: 'Enter Last Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last Name Can\'t Be Null';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            lastname = value;
                            fullname='$firstname'+'$lastname';
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        decoration: kdecoration.copyWith(
                            hintText: 'Enter Phone Number'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Phone No. Can\'t Be Null';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            pno = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: !_passwordVisible,
                        textAlign: TextAlign.left,
                        decoration:
                        kdecoration.copyWith(
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: (){
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password Can\'t Be Null';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Roundedbutton('Register', () async {
                        if (_formKey.currentState!.validate()) {
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
                           Navigator.pushNamed(context, Login.id);
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
      ),
    );
  }
}