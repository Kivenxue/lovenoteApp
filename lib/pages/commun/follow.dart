import 'package:flutter/material.dart';
import 'package:lovenote/services/ScreenAdaper.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}



Widget _MessageDataListWidget(){
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child:  Column(
      children: [
        Container(
        height: ScreenAdaper.height(100),
            child: Row(
              children: <Widget>[

                Container( 
                  margin: EdgeInsets.only(right:ScreenAdaper.width(20)),
                  width: ScreenAdaper.width(80),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset("images/avatar.jpg",fit: BoxFit.contain),
                  ),
                ),
                Container( 
                  margin: EdgeInsets.only(right:ScreenAdaper.width(50)),
                  child: Text(
                    "Kivenxue",
                    style: TextStyle(color: Colors.pinkAccent),
                )
                ),
                // Container( 
                //   child:Icon(Icon)
                // )
                Container( 
                  margin: EdgeInsets.only(right:ScreenAdaper.width(30)),
                  child: Text(
                    "271 评论",
                    style: TextStyle(
                      fontSize: ScreenAdaper.size(23),
                      color: Colors.grey
                    ),
                )
                ),
                Container( 
                  child: Text(
                    "1 分钟前",
                    style: TextStyle(
                      fontSize: ScreenAdaper.size(23),
                      color: Colors.grey
                    ),
                )
                ),
              ],
            ),
          ),
        Row(
           mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left:150),
              child: Text("社法委发旺旺发"),
            )
          ],
          
        ),
        Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [],
        )
      ],
    )
  );
}

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 5, 2, 0),
      child:Column(
        children: [
          _MessageDataListWidget()
        ],
      )
      
    );
  }
}