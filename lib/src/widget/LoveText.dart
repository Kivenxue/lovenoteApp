import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/ScreenAdaper.dart';

class LoveText extends StatelessWidget {

  final String text;
  final bool password;
  final Object onChanged;
  final Object onSubmitted;
  final int maxLines;
  final double height;
  final TextEditingController controller;

  LoveText({Key key,this.text="输入内容",this.password=false,this.onChanged=null,this.onSubmitted=null,this.maxLines=1,this.height=68,this.controller=null}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
  return TextField(
            cursorColor: Colors.grey,
            controller:controller,
            maxLines: this.maxLines ,
            obscureText: this.password,
            decoration: InputDecoration(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                fillColor: Colors.grey,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(0, -5, 0, 30),
                hintText:this.text,
                prefixIcon:Icon(Icons.drive_file_rename_outline,color: Colors.blueGrey,),
                // icon: Icon(Icons.drive_file_rename_outline,color: Colors.blueGrey,),
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(40),
                  )
                ),
            onChanged: this.onChanged,
            onSubmitted: this.onSubmitted,
      );
 
    }
}