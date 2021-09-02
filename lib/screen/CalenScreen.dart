import 'package:calendar/event.dart';
import 'package:calendar/model/BottomNavi.dart';
import 'package:calendar/screen/cateScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      appBar: new AppBar(
        title: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Calendar",
                  style: Theme.of(context).primaryTextTheme.headline1),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.circular(30)),
          height: 380,
          child: Column(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var rount = new MaterialPageRoute(
              builder: (BuildContext contex) => new Catepage());
          Navigator.of(context).push(rount);
        },
        label: Text("Add"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
