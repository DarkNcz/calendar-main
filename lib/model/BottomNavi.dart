import 'package:calendar/screen/AnalyScreen.dart';
import 'package:calendar/screen/CalenScreen.dart';
import 'package:calendar/screen/SetScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MainWidgetModel extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _screens = [SetScreen(), Calendar(), SetScreen(), AnaScreen()];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  get currentTab => this._currentTab;
  get currentScreen => this._screens[this._currentTab];
}
