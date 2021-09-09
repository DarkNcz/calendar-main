import 'package:calendar/model/BoxCard.dart';
import 'package:calendar/model/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: <Widget>[
              //พื้นหลังสีม่วงๆ
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(82, 98, 255, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                      bottomLeft: Radius.circular(60),
                    )),
              ),

              SafeArea(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "\n ยอดเงินทั้งหมด \n",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 18)),
                            TextSpan(
                                text: "\฿ ",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 30)),
                            TextSpan(
                                text: "5000.00 \n",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36)),
                            TextSpan(
                                text: " \n กระเป๋าตัง",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 18)),
                          ])),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 40,
                            ),
                            onPressed: () {})
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //Stack(),
                          /* Positioned(
                              child: SvgPicture.asset(card[index].cardE)),*/
                          BoxCard(
                            color: "6495ED",
                            name: "เงินออม \n",
                            money: 4000,
                          ),
                          BoxCard(
                            color: "42426F",
                            name: "หวย \n",
                            money: 1000,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ประวัติการใช้เงินล่าสุด",
                              style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400, fontSize: 18)),
                        ),
                      ],
                    ),
                    ListTile(
                      /* onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    leading: CircleAvatar(
                        backgroundImage: AssetImage("images/jhope.jpg"),
                      ),*/
                      title: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: 'อาหาร\n'),
                        TextSpan(
                            text: '9.30',
                            style: TextStyle(fontSize: 14, color: Colors.grey))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                      trailing: Text(
                        "- \฿430",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ListTile(
                      /* onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    leading: CircleAvatar(
                        backgroundImage: AssetImage("images/yibo.jpg"),
                      ),*/
                      title: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: 'ค่าเดินทาง\n'),
                        TextSpan(
                            text: '19.00',
                            style: TextStyle(fontSize: 14, color: Colors.grey))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                      trailing: Text(
                        "- \฿230",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
