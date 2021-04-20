import 'package:flutter/material.dart';

class MovingPage extends StatefulWidget {
  @override
  _MovingPageState createState() => _MovingPageState();
}

class _MovingPageState extends State<MovingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("我们的动态"),
      ),
    );
  }
}