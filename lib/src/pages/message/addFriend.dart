import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import 'package:lovenote/src/widget/SearchInput.dart';

class AddFriendPageWidget extends StatefulWidget {
  @override
  _AddFriendPageWidgetState createState() => _AddFriendPageWidgetState();
}

class _AddFriendPageWidgetState extends State<AddFriendPageWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:InkWell(
          child:Icon(Icons.arrow_back_ios,color: Colors.black),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title:Container(
          margin: EdgeInsets.only(left:90),
            child: Text('添加好友',style: TextStyle(color: Colors.black),
          )
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height:10),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child:Row(
            children: [
                Expanded(
                  child:SearchInputWidget(),
                  flex: 1, 
                ),
                Container(
                  color: Colors.black26,
                  margin: EdgeInsets.only(left:10),
                  height: 45,
                  
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black54)
                    ),
                    onPressed: (){
                      // CheckCodeButtonFuntion();
                    },
                    child: Text("搜索"),
                  ),
                )
              ],
            ),
          ),
        
          
          _friendDataList()
        ],
      ),
    );
  }
}


Widget _friendDataList(){
  return Card(
    child: ListTile(
    leading:Stack(
      children: [
        Container(
          width: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover,),
          )
        ),
        Positioned(
          bottom: 2,
          right: 0,
          child: Container(
            width: 18,
            child: Image.asset('assets/icon/sex_0.png',fit: BoxFit.contain),
          ),
        )
      ],
    ),
      title: Text("Kiven xue"),
      subtitle: Text("这个人很懒 什么都没写~",style: TextStyle(
        
      ),),
      trailing:Container(
        width: ScreenAdaper.width(120),
        height: ScreenAdaper.height(50),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.blueAccent, width: 1),
        ),
        child:InkWell(
          child: Text("添加",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.pinkAccent,
            ),
          ),
          onTap: (){
          
          }
        )
      )      
  )
  );
}