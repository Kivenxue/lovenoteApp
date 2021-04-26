import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import '../../widget/LoveText.dart';

class MessageCommentPage extends StatefulWidget {
  MessageCommentPage({Key key}) : super(key:key);
  @override
  _MessageCommentPageState createState() => _MessageCommentPageState();
}





Widget _userDetailWidget(){
  return  Container(
    height: ScreenAdaper.height(100),
    child: Row(
        children: <Widget>[
          Container(
            width: ScreenAdaper.width(80),
            child: ClipRRect(
              borderRadius: BorderRadius.circular((40)),
              child: Image.asset("assets/images/avatar.jpg",fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container( 
                  margin: EdgeInsets.only(left:ScreenAdaper.width(20)),
                  child: Text(
                    "Kivenxue",
                    style: TextStyle(color: Colors.pinkAccent),
                  )
                ),

                Container( 
                  margin: EdgeInsets.only(left:ScreenAdaper.width(20)),
                  child: Text(
                    "04-17 14:53",
                    style: TextStyle(
                      fontSize: ScreenAdaper.size(23),
                      color: Colors.grey
                    ),
                )
                ),
              ],
            ),
            flex: 4,
          ),

          Expanded(
            child: Container(
              width: ScreenAdaper.width(50),
              height: ScreenAdaper.height(50),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.pink, width: 1),
              ),
              child: Text("关注",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.pink
              ),
              ),
            ),
            flex: 1,
          )


        ],
      ),
  );

}


class MyImage extends StatelessWidget {
  String imgUrl;
  MyImage(this.imgUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdaper.width(500),
      child: Image.asset(this.imgUrl, fit: BoxFit.cover),
    );
  }
}

class _MessageCommentPageState extends State<MessageCommentPage> {
  bool showPhotoAction = false;

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        centerTitle: true,  
        backgroundColor: Colors.white,
        
        actions: [
          Container(
            // padding:  EdgeInsets.all(8),
            margin: EdgeInsets.all(10), 
            child:Icon(Icons.more_horiz,size: ScreenAdaper.size(55),color:Colors.black),
          )
        ],
      ),
      body:Stack(
        children: <Widget>[
            InkWell(
              child:Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                        _userDetailWidget(),
                        Row(
                          children: [
                            Expanded(
                              child:Container(
                                margin: EdgeInsets.only(left:20),
                                child: Text(
                                "愿未来所有的好时光都有你相伴，愿情话终有主，你我不再孤独",
                                style: TextStyle(
                                  fontSize: 18
                                ),
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 250,
                                ),
                              ),
                              flex:1 
                            ),
                          ],
                        ),

                    MyImage("assets/images/message.jpg"),
                    MyImage("assets/images/message.jpg"),
                    MyImage("assets/images/message.jpg"),
                    //评论区
                    
                    Row(
                      children: [
                        Expanded(
                          child:Container(
                            child:Text("全部评论(271)",style: TextStyle(color:Colors.black45)),
                          ),
                          flex: 1, 
                        ),
                        Expanded(
                          child:Container(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("按照时间",style: TextStyle(color:Colors.black45)),
                                Icon(Icons.arrow_drop_down,color: Colors.black38),
                                // Text("按照热度"),
                                // Icon(Icons.arrow_drop_up,color:Colors.black38)
                              ],
                            ),
                          ),
                          flex: 1,
                        )
                      ],
                    ),
                    //评论内容
                    Row(
                     children: [
                       Container(
                            width: ScreenAdaper.width(80),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("assets/images/avatar.jpg",fit: BoxFit.cover,),
                            ),
                          ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              Text("测试人员1",textAlign: TextAlign.left),
                              Row(
                                children: [
                                  Expanded(
                                    child:Text("沙发 04-17 19:23"),
                                    flex: 6,
                                  ),
                                  Expanded(
                                    child:Row(
                                      children: [
                                        Icon(Icons.thumb_up_alt,size: ScreenAdaper.size(30)),
                                        Text("+1",style: TextStyle(fontSize: 12))
                                      ],
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          flex: 1,
                        ),
                     ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left:45),
                      child:Text("neio",)
                    ),
                    Divider(color: Colors.black45,),
                    SizedBox(height:50),
                    ],
                  ),
                )
              ),
              onTap: (){
                setState(() {
                  this.showPhotoAction=false;
                  FocusScope.of(context).requestFocus(FocusNode());
                  // 隐藏键盘
                });
              },
            ),
          Positioned(
            bottom: 0,
            width: ScreenAdaper.width(750),
            child: Container(
              color: Colors.white,
              width: ScreenAdaper.width(750),
              height: ScreenAdaper.height(50),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                    InkWell(
                        child: Icon(Icons.add),
                        onTap: () {
                          setState(() {
                            this.showPhotoAction = !this.showPhotoAction;
                          });
                        },
                      ),
    
                   
                  ],
                  ),
                  this.showPhotoAction?Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: IconButton(
                          icon: Icon(Icons.photo_camera),
                          onPressed: (){

                          },
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.all(10),
                        child: IconButton(
                          icon: Icon(Icons.photo_library),
                          onPressed: (){

                          },
                        ),
                      ),
                    ],
                  ):Container(
                    height: 0
                  )
                ],
              ),
              )
            )
        ],
      )
    );
  }
}