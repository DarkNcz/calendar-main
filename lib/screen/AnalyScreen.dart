import 'package:flutter/material.dart';

class AnalyPage extends StatefulWidget {
  @override
  _AnalyPageState createState() => _AnalyPageState();
}

class _AnalyPageState extends State<AnalyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("AnalyPage"),
      ),
      body: new Center(
        child: new Text("This is AnaPage"),
      ),
    );
  }
}
