import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/ScreenAdaper.dart';

class LoveText extends StatelessWidget {

  TextEditingController _userSendInputController = TextEditingController();
  FocusNode _userSendInputNode = FocusNode();


  final String text;
  final Object onChanged;
  final Object onSubmitted;
  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderRadius:BorderRadius.circular(40),
    borderSide: BorderSide(
      color: Colors.grey[200],
    ),
  );
  LoveText({Key key,
  this.text="输入内容",
  this.onChanged=null,
  this.onSubmitted=null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
  return TextField(
        cursorColor: Colors.black54,
        controller:_userSendInputController,
        focusNode: _userSendInputNode,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        autofocus: true,
        decoration: InputDecoration(
            hintText:"请输入...",
            fillColor: Colors.white,
            filled: true,
            enabledBorder:_outlineInputBorder,
            focusedBorder:_outlineInputBorder,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10)
            ),
        onChanged: (text){
          print("");
        },

        onSubmitted: this.onSubmitted,
      );
 
    }
}