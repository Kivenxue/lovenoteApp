import 'package:flutter/material.dart';
import 'package:lovenote/services/ScreenAdaper.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}


_UserInfoWidget(){
    return Row(
      children: <Widget>[               
         Expanded(
            child:  Container(
              padding: EdgeInsets.all(ScreenAdaper.width(15)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child:Image.asset("images/avatar.jpg",
                fit: BoxFit.cover),
              ),
            ),
          flex: 1
          ),
           Expanded(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text("无力",
               style: TextStyle(
                 fontSize: ScreenAdaper.size(35),
                 fontWeight: FontWeight.bold)
                ),
               Text("用户id: 12131223",
               style: TextStyle(color: Colors.grey),
               )
              ],
            ),
          flex: 3
          ),
          Expanded(
            child:  Container(
              alignment: Alignment.centerRight,
              child: Icon(Icons.chevron_right,color: Colors.grey,),
            ),
          flex: 1
          ),
      ],
    );
   

}


_UserVipWidget(){
  return Text("是否冲Vip");
  
}


_UserGridWidget(){
  return Container(
    padding: EdgeInsets.fromLTRB(ScreenAdaper.width(10), 0, ScreenAdaper.width(10), 0),
    child: Row(
    children: [
       Expanded(
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.insights_outlined,color: Colors.pinkAccent,size: ScreenAdaper.size(55),),
              ),
              Text("签到奖励")
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.palette_outlined,color: Colors.pinkAccent,size: ScreenAdaper.size(55),),
              ),
              Text("主题")
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.collections_outlined,color: Colors.pinkAccent,size: ScreenAdaper.size(55),),
              ),
              Text("时光相册")
            ],
          ),
          flex: 1,
        ),
        Expanded(
          child:Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.sports_esports_outlined,color: Colors.pinkAccent,size: ScreenAdaper.size(55),),
              ),
              Text("小游戏")
            ],
          ),
          flex: 1,
        ),
        
    ])
  );
}


_UserListDataWidget(){
  return Card(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.headset_mic,color: Colors.blueAccent,),
          title:Text("客服",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey),
        ),
        
        Divider(color: Colors.grey,height: ScreenAdaper.height(1)),

        ListTile(
          leading: Icon(Icons.person_add,color: Colors.blueAccent,),
          title:Text("推介好友使用",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),


        Divider(color: Colors.grey,height: ScreenAdaper.height(1)),

        ListTile(
          leading: Icon(Icons.settings,color: Colors.blueAccent,),
          title:Text("设置",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),


        Divider(color: Colors.grey,height: ScreenAdaper.height(1)),

        ListTile(
          leading: Icon(Icons.thumb_up_alt_outlined,color: Colors.blueAccent,),
          title:Text("好评",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    ),
  );
  
}

// _UserListDataWidget(){}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
          backgroundColor: Colors.pinkAccent,
          actions: [
            Text("设置")
          ],
        ),
        preferredSize: Size.fromHeight(ScreenAdaper.height(35)),
      ),
      body:Column(
        children: [
          _UserInfoWidget(),
          Divider(color: Colors.grey,height: ScreenAdaper.height(1),),
          // _UserListWidget(),
          // Divider(color: Colors.grey,height: ScreenAdaper.height(1),),
          // 
          _UserVipWidget(),
          Divider(color: Colors.grey,height: ScreenAdaper.height(1)),
          _UserGridWidget(),

          _UserListDataWidget()
        ],

      )
    );
  }
}