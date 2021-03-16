import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double defaultPadding = 16.0;
const Radius defaultRadius = Radius.circular(16);

const List<String> dishes = [
  'assets/dish.png',
  'assets/dish1.png',
  'assets/dish2.png',
  'assets/dish3.png',
  'assets/dish4.png',
  'assets/dish5.png',
];

ThemeData mainTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  primaryColor: Color(0xFF0B3364),
  fontFamily: 'HindSiliguri',
  textTheme: TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 60,
      ),
      headline5: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 48,
        height: 1,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      subtitle2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      bodyText1: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      )).apply(bodyColor: Color(0xFF133969), displayColor: Color(0xFF133969)),
);
