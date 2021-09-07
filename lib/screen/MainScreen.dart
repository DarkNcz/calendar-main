import 'package:calendar/screen/AnalyScreen.dart';
import 'package:calendar/screen/CalenScreen.dart';
import 'package:calendar/screen/HomeScreen.dart';
import 'package:calendar/screen/SetScreen.dart';
import 'package:calendar/screen/Summarize.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //หน้าที่รันแล้วขึ้นครั้งแรก
  int currentIndex = 0;
  final screens = [
    SumPage(),
    CalendarPage(),
    HomePage(),
    AnalyPage(),
    SetPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.white, เมื่อกดจะทำให้สีไอคอนเปลี่ยน
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.summarize),
              label: 'Sum',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'calendar',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'pie_chart',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
              backgroundColor: Colors.blue),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
