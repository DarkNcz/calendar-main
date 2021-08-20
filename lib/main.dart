import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calendar",
      home: Calendar(),
    );
  }
}*/

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.isDarkTheme ? dark : light,
          home: Calendar(),
        );
      }),
    );
  }
}