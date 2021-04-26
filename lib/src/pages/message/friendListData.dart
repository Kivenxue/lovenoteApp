import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';

class FriendListPage extends StatefulWidget {
  @override
  _FriendListPageState createState() => _FriendListPageState();
}

class _FriendListPageState extends State<FriendListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,color: Colors.black87,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title:Container(
          margin: EdgeInsets.only(right:55),
          alignment: Alignment.center,
          child:Text("好友列表",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black)
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          _friendListData()
        ],
      ),
    );
  }



  Widget _friendListData(){
      return Card(
        child: ListTile(
          leading:Container(
            width: 55,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset('assets/images/avatar2.jpg',fit: BoxFit.cover,),
            )
          ),
          title: Text("矢泽妮可"),
          subtitle: Text(
            "妮可妮可妮~",
            style: TextStyle(
            
            ),
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing:  Container(
            margin: EdgeInsets.only(left:10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent)
              ),
              onPressed: (){
                // CheckCodeButtonFuntion();'
              },
              child: Text("发消息"),
            ),
          ),

        ),
      );
  }
}