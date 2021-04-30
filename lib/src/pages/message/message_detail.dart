import 'dart:math';

import 'package:flutter/material.dart';
import '../../widget/LoveText.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../services/ScreenAdaper.dart';
//引入请求库
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class MessageDetailPage extends StatefulWidget {
  MessageDetailPage({Key key}) : super(key:key);
  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  ScrollController _scrollController = new ScrollController();
  TextEditingController _message = TextEditingController();
  List messageList = [];
  //是否显示
  bool showPhotoAction = false;
  bool showEmojiPiker=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left:105),
          child: Text("聊天",style: TextStyle(
            color: Colors.black
          ),),
        ),
        leading:InkWell(
          child:Container(
            margin: EdgeInsets.only(left:20),
            child: Icon(Icons.arrow_back_ios,color: Colors.black54,)
          ),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body: Stack(
        children: [
        //  buildBackground(),
         InkWell(
           child: ChatDetailList(),
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
              width: ScreenAdaper.width(750),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                      //麦克风
                      Container(
                        width: 50,
                        child: Icon(Icons.mic),
                      ),
                      Expanded(
                        flex: 1,
                        child: LoveText(),
                      ),
                      Container(
                        padding: EdgeInsets.all(ScreenAdaper.width(20)),
                        child:  Container(
                          // width: ScreenAdaper.width(68),
                          // height: ScreenAdaper.height(68),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              ScreenAdaper.width(68)
                            )
                          ),
                          child: InkWell(
                            child: Icon(Icons.emoji_emotions_outlined),
                            onTap: () {
                              setState(() {
                                this.showEmojiPiker = !this.showEmojiPiker;
                              });
                              
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        )
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child:Container(
                          // width: ScreenAdaper.width(68),
                          // height: ScreenAdaper.height(68),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              ScreenAdaper.width(68)
                            )
                          ),
                          child: InkWell(
                            child: Icon(Icons.add),
                            onTap: () {
                              setState(() {
                                this.showPhotoAction = !this.showPhotoAction;
                              });
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          )
                        )
                      ),
                    ],
                  ),
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
                  ),
                  this.showEmojiPiker?Row(
                    children: <Widget>[
                      Text("adcode")
                    ],
                  ):Container(
                    height: 0,
                  )
                  
                ],
              ),
              )
            )
        ],
      ),
    );
  }
}

class ChatRecord{
  int sender;
  String content;
  String avatarUrl;
  ChatRecord({this.sender,this.content,this.avatarUrl});
}

class ChatDetailList extends StatelessWidget {
  const ChatDetailList ({Key key}): super(key:key);



  @override
  Widget build(BuildContext context) {
    String ava1 = 'assets/images/avatar.jpg';
    String ava2 = 'assets/images/avatar2.jpg';
    // ignore: deprecated_member_use
    List<ChatRecord> record = List<ChatRecord>();
    record.add(ChatRecord(avatarUrl:ava2,sender: 0,content: "11111"));
    record.add(ChatRecord(avatarUrl: ava2,sender: 0,content: "2222"));    
    record.add(ChatRecord(avatarUrl: ava1,sender: 1,content: "1111\n2222"));
    record.add(ChatRecord(avatarUrl: ava2,sender: 0,content: "嗯嗯"));
    
    
    return ListView.builder(
      itemCount: record.length,
      itemBuilder: (context,index){
        return ChatRow(
          avatarUrl: record[index].avatarUrl,
          content: record[index].content,
          sender: record[index].sender,
        );
      },
    );
  }
}

class ChatRow extends StatelessWidget {
  //
  const ChatRow ({Key key,@required this.sender,@required this.content, @required this.avatarUrl}): super(key:key);
  final  int sender;//0 自己  1 other
  final String content;
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    //屏幕 750 份
    double rpx = MediaQuery.of(context).size.width/750;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20*rpx,vertical: 20*rpx),
      //评论发送
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: sender==0?MainAxisAlignment.start:MainAxisAlignment.end,
        children: <Widget>[
          sender==0
            ?CircleAvatar(
              backgroundImage: AssetImage(avatarUrl),
              )
            :Container(),
          sender == 0?
          Container(
            margin: EdgeInsets.only(left: 20*rpx),
            child:  CustomPaint(painter: ChatBoxPainter(
              color: Colors.pinkAccent,
              width: 20*rpx,
              height: 15*rpx,
            )),
          ):Container(),
          //
          Container(
            padding: EdgeInsets.all(15*rpx),
            margin: EdgeInsets.only(left: 20*rpx,right: 20*rpx),
            child: Text(content,style: TextStyle(fontSize: 27*rpx,letterSpacing: 1.5*rpx,height: 1.7)),decoration: BoxDecoration(
              color:sender==0?Colors.pinkAccent :Colors.greenAccent,
              borderRadius: BorderRadius.circular(10*rpx),
            ),
          ),
          //三角旋转180度
          sender == 1
          ?Transform.rotate(angle: pi,child: Container(
            child:  CustomPaint(painter: ChatBoxPainter(
              color: Colors.greenAccent,
              width: 20*rpx,
              height: 15*rpx,
            )),
          ))
         :Container(),
        sender==1
          ?CircleAvatar(
            backgroundImage: AssetImage(avatarUrl),
            )
          :Container(),
        ],
      ),
    );
  }
}

//发布人   内容 时间  类型  文字 表情包 图片

class ChatBoxPainter extends CustomPainter{
  ChatBoxPainter({@required this.width, @required this.height,@required this.color}); 
  
  final double width;
  final double height;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
      //绘制三角型
      Path path = Path()
      ..moveTo(0, height/2)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..lineTo(0, height/2);

      Paint paint = Paint()
      ..style=PaintingStyle.fill
      ..color=color;


      canvas.drawPath(path, paint);

      
    }
  
    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;




  
}