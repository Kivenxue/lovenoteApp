import 'package:flutter/material.dart';
import 'package:lovenote/src/pages/message/addFriend.dart';
import 'package:lovenote/src/pages/message/friendListData.dart';
import 'package:lovenote/src/pages/message/message_detail.dart';
import 'package:lovenote/src/pages/message/sarch_friend.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import 'package:lovenote/src/widget/SearchInput.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';


class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with AutomaticKeepAliveClientMixin{
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          margin: EdgeInsets.only(left:30),
          alignment: Alignment.center,
          child:Text("消息",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black)
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right:15),
            child: Icon(Icons.face_retouching_natural,color: Colors.black,)
          )
         
        ],
        backgroundColor: Colors.white,

      ),
      body: Stack(
        children: [
          Column(
            children: [
              //搜索框
              _staticSearchInput(),
              //消息列表
              _messageListDataWidget()
              
            ],
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: RoteFloatingButton(
              //菜单图标组
              // opacity: true,
              iconList: [
                Icon(Icons.group_outlined,color: Colors.black54,),
                Icon(Icons.person_add,color: Colors.black54,),
              ],
              //点击事件
              clickCallback: (int index){
               if(index == 0){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => FriendListPage()));
               }else if(index == 1){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => AddFriendPageWidget()));
               }
              },
            ),
          )

        ],
      )
      

    );
  }


Widget _staticSearchInput(){
  return Container(
    color: Colors.white,
    width: double.infinity,
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       InkWell(
         child: Container(
          width: 370,
          height: 45,
          color: Colors.grey[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.search_outlined),
              ),
              Text("搜索好友")
            ],
          ),
        ),
        onTap: (){
         Navigator.push(context,MaterialPageRoute(builder: (context) => SetarchFriendListPage()));
        },
       )
      ],
    ),
   
  );
}


 Widget _messageListDataWidget(){
   return InkWell(
     child: Card(
      child: ListTile(
        leading: Container(
          width: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover,),
          )
        ),
        title: Text("Kiven xue"),
        subtitle: Text("SSL 证书",style: TextStyle(
          
        ),),
        trailing:Container(
          child: Text("04-12",style: TextStyle(
            color: Colors.black54
          )),
        )
      ),
    ),
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => new MessageDetailPage()));
    },
   );
 }

}



