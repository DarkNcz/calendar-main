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
              children: <Widget>[Icon(Icons.textsms), Text("  หมวดหมู่")],
            )),
        body: Container(
          //padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.pink[100]]),
            color: Colors.purple[100],
          ),
          child: Category(),
        ));
  }
}
