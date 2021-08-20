//import 'package:calendar/Categories.dart';
import 'package:calendar/Categories.dart';
import 'package:calendar/event.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();
  int _currentIndex = 0;

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
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
      backgroundColor: Theme.of(context).primaryColor,
      //ส่วนของหัวแอพ สร้างเพื่อไม่ให้มันติดโทรศัทพ์ ให้เว้นที่
      appBar: new AppBar(
          title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            //ฝั่งซ้ายของแถบหัวแอพ
            Text("Calendar",
                style: Theme.of(context).primaryTextTheme.headline1),
            //ฝั่งขวาของแถบฟัวแอพ ทำไว้ให้เลือกธีม แต่ต้องเปลี่ยนเป็นอย่างอื่นแล้วเอาธีมไปใส่ในตั้งค่า
            Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => IconButton(
                    icon: notifier.isDarkTheme
                        ? FaIcon(
                            FontAwesomeIcons.moon,
                            size: 20,
                            color: Colors.white,
                          )
                        : Icon(Icons.wb_sunny),
                    onPressed: () => {notifier.toggleTheme()}))
          ])
          //title: Text("Calendar"),
          //centerTitle: true,
          ),
      //ส่วนตรงกลางแอพ
      body: Padding(
        //เว้นจากขอบทรศ.ในทุกๆด้าน
        padding: const EdgeInsets.all(8.0),
        //กรอบสีแดงๆใช้container
        child: Container(
          padding: EdgeInsets.all(20),
          //ส่วนของการตกแต่งcontainer
          decoration: BoxDecoration(
              color: Colors.red[400], borderRadius: BorderRadius.circular(30)),
          height: 380,
          child: Column(
            //ส่วนของการตั้งค่าปฎิทิน
            children: [
              TableCalendar(
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

                //Day Changed
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

                //To style the Calendar
                calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  //วันที่เลือก สีแดง
                  selectedDecoration: BoxDecoration(
                    color: Colors.red[900],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  //วันปัจจุบันสีม่วง
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
                  formatButtonVisible: true,
                  titleCentered: true,
                  formatButtonShowsNext: false,
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.red[300],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  formatButtonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              //น่าจะเป็นส่วนที่ไว้กรอก เก็บไว้ก่อนเผื่อใช้อะไรได้
              ..._getEventsfromDay(selectedDay).map(
                (Event event) => ListTile(
                  title: Text(
                    event.title,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //แถบข้างล่างของแอพ
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        /* selectedFontSize: 20,
        unselectedFontSize: 15,*/
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp, color: Colors.purple),
              label: "book",
              backgroundColor: Colors.purple[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_giftcard, color: Colors.blue),
              label: "wallet",
              backgroundColor: Colors.blue[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart, color: Colors.green),
              label: "analytics",
              backgroundColor: Colors.green[900]),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.orange),
              label: "settings",
              backgroundColor: Colors.orange[900]),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //ส่วนของปุ่มกดadd เขียนเชื่อมไปหน้าcategoriesเเล้ว
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var rount = new MaterialPageRoute(
              builder: (BuildContext contex) => new Catepage());
          Navigator.of(context).push(rount);
        }
        /*=> showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay].add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        )*/
        ,
        //ข้อความและสัญลักษณ์ในปุ่ม
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
