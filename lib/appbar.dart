import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar Test'),
          centerTitle: true,
        ),
        body: HomeCenter(),
      ),
    );
  }
}

class HomeCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            child: Column(children: [
              Expanded(
                  child: Container(
                      color: Colors.amber,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Text Row 1'),
                            Text('Text Row 2'),
                            Text('Text Row 3')
                          ]))),
              Expanded(
                  child: Container(
                      color: Colors.deepOrange,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Text Column 1'),
                            Text('Text Column 2'),
                            Text('Text Column 3')
                          ])))
            ]),
            color: Colors.blue));
  }
}
