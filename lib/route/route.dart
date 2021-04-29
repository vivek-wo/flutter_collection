import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RouteMain()));
}

class RouteMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteMainState();
  }
}

class RouteMainState extends State<RouteMain> {
  var s;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Route Navigator Demo')),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Center(child: Text('Route And Navigator ' + s))),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => RouteA()))
                          .then((value) => this.setState(() {
                                s = value;
                              }));
                    },
                    child: Text('跳转')),
                width: double.infinity,
                height: 48),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RouteB(s: '传参：BB')));
                    },
                    child: Text('跳转带参数')),
                width: double.infinity,
                height: 48)
          ],
        ));
  }
}

class RouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Route Navigator Demo')),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Center(child: Text('Route A'))),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, '返回 Main');
                    },
                    child: Text('返回带参数')),
                width: double.infinity,
                height: 48),
          ],
        ));
  }
}

class RouteB extends StatelessWidget {
  final s;

  const RouteB({Key key, this.s}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Route Navigator Demo'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Center(child: Text('Route B ' + s))),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('返回')),
                width: double.infinity,
                height: 48),
          ],
        ));
  }
}
