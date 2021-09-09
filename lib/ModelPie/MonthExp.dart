import 'package:calendar/ModelPie/CateRow.dart';
import 'package:calendar/ModelPie/PieView.dart';
import 'package:flutter/material.dart';

class MontlyExpenses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: height,
        color: Color.fromRGBO(193, 214, 233, 1),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CateRow(),
                      PieView(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
