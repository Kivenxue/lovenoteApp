import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
			appBar: AppBar(
				title: Text("话题活动",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white.withOpacity(0.9), // Colors.white.withOpacity(0.1),
        elevation: 0,
			),
			body:Image.asset(
        'images/mesagebg.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
		);
  }
}