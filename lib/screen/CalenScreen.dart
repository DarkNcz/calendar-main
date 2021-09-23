import 'dart:ui';
import 'package:calendar/event.dart';
import 'package:calendar/model/cateScreen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<CalendarPage> {
  //เกี่ยวกับ Diary
  Map<DateTime, List<Diary>> selectedEvents;

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  Container taskList(
      String title, String description, IconData iconData, Color iconColor) {
    return Container(
      padding: EdgeInsets.only(top: 10),
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
  void initState() {
    selectedEvents = {};
    super.initState();
  }

//เกี่ยวกับ Diary
  List<Diary> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(193, 214, 233, 1), Colors.pink[100]]),
          color: Colors.purple[100],
        ),
        child: Container(
          child: Expanded(
            flex: 1,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    daysOfWeekVisible: true,
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                      print(focusedDay);
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },
                    eventLoader: _getEventsfromDay,
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                        color: Colors.red[900],
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      selectedTextStyle: TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    headerStyle: HeaderStyle(
                        /*leftChevronIcon: Icon(Icons.arrow_back_ios,
                          size: 15, color: Colors.white),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios,
                          size: 15, color: Colors.white),
                      titleTextStyle: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 16),
                      formatButtonDecoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      formatButtonTextStyle: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),*/
                        formatButtonVisible: true,
                        titleCentered: true,
                        formatButtonShowsNext: false,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        formatButtonTextStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.only(left: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Color(0xff30384c)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("วันนี้",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        taskList(
                            "ค่าเดินทาง", "150", Icons.train, Colors.white),
                        taskList("ค่าอาหาร", "150", Icons.fastfood_outlined,
                            Colors.white),
                        taskList("ค่ารักษา", "1500", Icons.medical_services,
                            Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var rount = new MaterialPageRoute(
              builder: (BuildContext contex) => new Catepage());
          Navigator.of(context).push(rount);
        },
        label: Text("เพิ่ม"),
        icon: Icon(Icons.border_color_outlined),
      ),
    );
  }
}
