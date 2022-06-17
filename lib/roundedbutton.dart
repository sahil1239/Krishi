import 'package:flutter/material.dart';

class Roundedbutton extends StatelessWidget {
  late String text;
  late void Function() onpressed;
  late Color bg;
  late Color tex;
  Roundedbutton(this.text, this.onpressed, this.bg, this.tex);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: bg,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onpressed,
          minWidth: 320.0,
          height: 40.0,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              color: tex,
            ),
          ),
        ),
      ),
    );
  }
}
