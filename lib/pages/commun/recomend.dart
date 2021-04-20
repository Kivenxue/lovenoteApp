import 'package:flutter/material.dart';
import 'package:lovenote/services/ScreenAdaper.dart';

class RecomendPage extends StatefulWidget {
  @override
  _RecomendPageState createState() => _RecomendPageState();
}

class _RecomendPageState extends State<RecomendPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
           child: Text("Test Recomend"),
          )
        ],
      ),
    );
  }
}