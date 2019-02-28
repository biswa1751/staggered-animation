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
    //TODO: 1: Initialize the animation Controller and Animation
    //TODO: 2: Forward the animation
    //TODO: 5: Remove The Forward Animation
  }

  //TODO: 3: Defining the Animating Object
  Widget animatingObject() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Placeholder(),
    );
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
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                child: animatingObject(),
              ),
            ),
            ////TODO: 4: Make A Raised Button to animate
          ],
        ));
  }
}
