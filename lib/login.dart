import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'roundedbutton.dart';
import 'constants.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:carpool/network.dart';
import 'geomap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  static String id = 'login';
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final storage = new FlutterSecureStorage();
  bool load = false;
  String? email;
  String? password;
  bool _passwordVisible=false;
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        opacity: 0.3,
        inAsyncCall: load,
        child: Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/farming.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            constraints: BoxConstraints.expand(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60, top: 40),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
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
                            width: 150,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Login',
                              style: GoogleFonts.raleway(
                                  textStyle: kheading.copyWith(fontSize: 50)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.left,
                            decoration:
                                kdecoration.copyWith(hintText: 'Enter Email'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email Can\'t Be Null';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textAlign: TextAlign.left,
                            obscureText: !_passwordVisible,
                            decoration: kdecoration.copyWith(
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
                              password = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Roundedbutton(
                            'Login',
                            () async {
                              if (_formKey.currentState!.validate()) {
                                // setState(() {
                                //   load = true;
                                // });
                              //   Network net = Network(
                              //       'https://carpoolv2.herokuapp.com/user/login');
                              //   int num =
                              //       await net.authenticate(email, password);
                              //   setState(() {
                              //     load = false;
                              //   });
                              //   if (num == 1) {
                                  Navigator.pushNamed(context, Geomap.id);
                              //   } else if (num == 0) {
                              //     Fluttertoast.showToast(
                              //       msg: 'Incorrect Email or Password',
                              //       toastLength: Toast.LENGTH_SHORT,
                              //       backgroundColor: Colors.grey.shade700,
                              //       textColor: Colors.white,
                              //       fontSize: 15,
                              //     );
                              //   }
                              }
                            },
                            Colors.white,
                            Colors.black,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
