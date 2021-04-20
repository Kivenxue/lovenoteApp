import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../services/ScreenAdaper.dart';
//引入请求库
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import '../../widget/JdText.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("聊天"),
      ),
      body: Stack(
        children: [
         InkWell(
           child:  Container(
            child:  ListView.builder(
            controller: this._scrollController,
            itemCount: this.messageList.length,
            itemBuilder: (context,index){
              return ListTile(

              );
            },
          ),
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
              width: ScreenAdaper.width(750),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: JdText(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenAdaper.width(20)),
                      child:  Container(
                        width: ScreenAdaper.width(68),
                        height: ScreenAdaper.height(68),
                        decoration: BoxDecoration(
                          color:Colors.black12,
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
                          },
                        )
                      )
                    )
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
      ),
    );
  }
}