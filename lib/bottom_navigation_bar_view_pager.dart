import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _currentPosition = 0;

  var _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: [
        PageHome(color: 0xFFE3F2FD),
        PageSetting(
          color: 0xFFFFA000,
        )
      ], onPageChanged: onPageChanged, controller: _pageController),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_work), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
        ],
        onTap: (position) {
          _pageController.animateToPage(position,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        currentIndex: _currentPosition,
      ),
    );
  }

  void onPageChanged(int position) {
    this.setState(() {
      if (_currentPosition != position) {
        _currentPosition = position;
      }
    });
  }
}

class PageHome extends StatelessWidget {
  final int color;

  const PageHome({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Container(
          color: Color(this.color),
        ));
  }
}

class PageSetting extends StatelessWidget {
  final int color;

  const PageSetting({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(this.color),
    ));
  }
}
