import 'package:flutter/material.dart';

const kheading = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 64,
);

const kdecoration = InputDecoration(
  hintText: 'Enter your email',
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const ktextstyle = TextStyle(
  fontSize: 18,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);
