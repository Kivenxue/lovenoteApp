import 'package:flutter/material.dart';


class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Center(
        child:RaisedButton(
          child: Text("跳转聊天详情"),
          onPressed: (){
            Navigator.pushNamed(context, '/messageDetail');
          },
        ),
      ),
    );
  }
}