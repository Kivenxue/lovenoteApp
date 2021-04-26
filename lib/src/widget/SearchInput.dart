import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../services/ScreenAdaper.dart';

class SearchInputWidget extends StatelessWidget {

  TextEditingController _firendSearchController = TextEditingController();
  FocusNode _firendSerchFocusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  final String text;
  final Object onChanged;
  final Object onSubmitted;
  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Colors.grey[200],
    ),
  );


  SearchInputWidget({Key key,
  this.text="输入内容",
  this.onChanged=null,
  this.onSubmitted=null,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
  return
       Container(
        // width: 300,
        // margin: EdgeInsets.only(left:20),
        constraints: BoxConstraints(
          minHeight: 15.0,
        ),
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          // borderRadius: BorderRadius.all(Radius.circular(40)
          // )
        ),
        child: TextField(
          controller: _firendSearchController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          autofocus: true,
          decoration: InputDecoration(
            hintText:"搜索好友列表",
            enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            ),
            focusedBorder:_outlineInputBorder,
            prefixIcon: Icon(Icons.search_outlined,color: Colors.blueGrey,),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10)
          ),
          
          
        ),
      );
 
  }
}




Widget _searchFriendDataWidget(){
  //定义输入框控制器
  TextEditingController _firendSearchController = TextEditingController();
  FocusNode _firendSerchFocusNode = FocusNode();
  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Colors.grey[200],
    ),
  );

  return Column(
          children: [
            Expanded(
              child: TextField(
               controller: _firendSearchController,
               focusNode: _firendSerchFocusNode,
               style: TextStyle(fontSize: 16,color: Colors.black87),
               maxLength: 10,
               minLines: 1,
               onChanged: (text){
                 
               },
               decoration: InputDecoration(
                 fillColor: Colors.grey[50],
                 filled: true,
                 isCollapsed: true,
                 contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                 border: _outlineInputBorder,
                 focusedBorder: _outlineInputBorder,
                 enabledBorder: _outlineInputBorder,
                 disabledBorder: _outlineInputBorder,
                 focusedErrorBorder: _outlineInputBorder,
                errorBorder: _outlineInputBorder,
               )
              )
            )
          ],
        );
}