import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  Container taskList(
      String title, String description, IconData iconData, Color iconColor) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
            size: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(description,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          color: Color(0xff30384c)),
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text("วันนี้",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
              ),
              taskList("Task1", "ค่าเดินทาง", Icons.train, Colors.white),
              taskList(
                  "Task2", "ค่าอาหาร", Icons.fastfood_outlined, Colors.white),
              taskList(
                  "Task3", "ค่ารักษา", Icons.medical_services, Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
