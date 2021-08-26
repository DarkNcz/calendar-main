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
  int _selectedItem = 0;

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
            ]),
        //title: Text("Calendar"),
        //centerTitle: true,
        //backgroundColor: Colors.red[800],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red[200], Colors.blue[200]],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
        ),
        elevation: 20,
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
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(30)),
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
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.wallet_travel,
          Icons.calendar_today,
          Icons.pie_chart,
          Icons.settings,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
      //ส่วนของปุ่มกดadd เขียนเชื่อมไปหน้าcategoriesเเล้ว
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var rount = new MaterialPageRoute(
              builder: (BuildContext contex) => new Catepage());
          Navigator.of(context).push(rount);
        },
        //ข้อความและสัญลักษณ์ในปุ่ม
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    super.initState();

    _selectIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }
    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.purple),
                ),
                gradient: LinearGradient(colors: [
                  Colors.purpleAccent.withOpacity(0.3),
                  Colors.purpleAccent.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
