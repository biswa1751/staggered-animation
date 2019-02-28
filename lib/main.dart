import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Staggereed Animation',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _opacity;
  Animation<double> _height;
  Animation<double> _width;
  Animation<EdgeInsets> _padding;
  Animation<BorderRadius> _borderRadius;
  Animation<Color> _color;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.1, curve: Curves.ease)));
    _width = Tween<double>(begin: 80, end: 140).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.125, 0.25, curve: Curves.ease)));
    _height = Tween<double>(begin: 80, end: 140).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.25, 0.375, curve: Curves.ease)));
    _padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(bottom: 5), end: EdgeInsets.only(bottom: 80))
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.375, 0.4, curve: Curves.ease)));
    _borderRadius = BorderRadiusTween(
            begin: BorderRadius.circular(4), end: BorderRadius.circular(70))
        .animate(CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.4, 0.525, curve: Curves.ease)));
    _color = ColorTween(begin: Colors.indigo[100], end: Colors.green).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.525, 0.65, curve: Curves.ease)));
  }

  Widget animatingObject() {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Container(
              padding: _padding.value,
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: _opacity.value,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: _height.value,
                  width: _width.value,
                  padding: _padding.value,
                  decoration: BoxDecoration(
                    borderRadius: _borderRadius.value,
                    border: Border.all(color: Colors.indigo[300], width: 3),
                    color: _color.value,
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 10;
    return Scaffold(
        appBar: new AppBar(title: new Text('Staggereed Animation')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      border: Border.all(color: Colors.black.withOpacity(0.5))),
                  child: animatingObject()),
            ),
            SizedBox(
              height: 60,
              width: 100,
              child: RaisedButton(
                onPressed: () {
                  if (_animationController.isCompleted) {
                    _animationController.reverse();
                  } else {
                    _animationController.forward();
                  }
                },
                child: Text("START"),
              ),
            )
          ],
        ));
  }
}
