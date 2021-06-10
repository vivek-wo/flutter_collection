import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RouteMain(), routes: {
    'route_c': (context) => RouteC(),
    'route_d': (context) => RouteD()
  }));
}

class RouteMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RouteMainState();
  }
}

class RouteMainState extends State<RouteMain> {
  var s = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Route Navigator Demo')),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Center(
                    child: Text('Route And Navigator $s',
                        style: TextStyle(color: Colors.blue, fontSize: 24)))),
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(8))), //圆角弧度
                    ),
                    child: Text('跳转', style: TextStyle(color: Colors.amber))),
                width: double.infinity,
                height: 48),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
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
                height: 48),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'route_c')
                          .then((value) => this.setState(() {
                                s = value;
                              }));
                    },
                    child: Text('注册路由')),
                width: double.infinity,
                height: 48),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'route_d',
                          arguments: '传参DD');
                    },
                    child: Text('注册路由带参数')),
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
                child: Center(child: Text('Route B $s'))),
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

class RouteC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Route Navigator Demo')),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Center(child: Text('Route C'))),
            Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, '返回 C Main');
                    },
                    child: Text('返回带参')),
                width: double.infinity,
                height: 48),
          ],
        ));
  }
}

class RouteD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: AppBar(title: Text('Route Navigator Demo')),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 32, bottom: 32),
                child: Center(child: Text('Route D $msg'))),
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


