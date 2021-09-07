import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
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
