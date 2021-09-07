import 'package:calendar/screen/MainScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Main Page",
      home: MainPage(),
    );
  }
}
