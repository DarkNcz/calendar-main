import 'package:calendar/model/HexColor.dart';
import 'package:flutter/material.dart';

class BoxCard extends StatelessWidget {
  final String color;
  final String name;
  final double money;

  BoxCard({this.color, this.name, this.money});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
      child: Container(
        height: 180,
        width: 300,
        decoration: BoxDecoration(
          color: HexColor(color),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(3, 1),
                blurRadius: 7,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    TextSpan(
                        text: "${money.toString()}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                  ], style: TextStyle(fontSize: 22))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
