import 'package:firebase_connection/Pages/Setup/welcom.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase_connection',
      home: WelcomePage(), 
    );
  }
}
