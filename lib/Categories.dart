//หน้าหมวดหมู่ จัดวางโครงสร้างได้เลย
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(100),
          child: FloatingActionButton(
            child: Row(
              children: <Widget>[Text("b"), Icon(Icons.navigate_next)],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
