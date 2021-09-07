import 'package:calendar/categories/Categories.dart';
import 'package:flutter/material.dart';

class Catepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatepageState();
  }
}

class _CatepageState extends State<Catepage> {
  final String titleString = "catepage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Row(
            children: <Widget>[Icon(Icons.textsms), Text("Categories")],
          )),
      body: Category(),
    );
  }
}
