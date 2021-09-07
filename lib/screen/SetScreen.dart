import 'package:flutter/material.dart';

class SetPage extends StatefulWidget {
  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SettingPage"),
      ),
      body: new Center(
        child: new Text("This is Setting"),
      ),
    );
  }
}
