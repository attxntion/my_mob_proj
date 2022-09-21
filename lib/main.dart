import 'package:flutter/material.dart';
import 'loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return MaterialApp(
      title: 'Home Task 1',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}