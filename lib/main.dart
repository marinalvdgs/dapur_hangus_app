import 'package:dapur_hangus_app/screens/start_screen.dart';
import 'package:dapur_hangus_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dapur Hangus',
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
