import 'package:flutter/material.dart';
import 'package:lovenote/src/pages/commun/total/get_release.dart';
import 'package:lovenote/src/pages/commun/total/release_page.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';
import '../commun/messagComment.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}



Widget _MessageDataListWidget(BuildContext context){
  return Container(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child:  Card(
      child: Column(
      children: [
          Container(
              child: InkWell(
                  child: Row(
                  children: <Widget>[
                    Container( 
                      margin: EdgeInsets.only(right:ScreenAdaper.width(20)),
                      width: ScreenAdaper.width(80),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset("assets/images/avatar.jpg",fit: BoxFit.contain),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container( 
                          margin: EdgeInsets.only(right:ScreenAdaper.width(50)),
                          child: Text(
                            "Kivenxue",
                            style: TextStyle(color: Colors.pinkAccent),
                          )
                        ),

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
                      ],
                    ),
                  
                  
                    Container( 
                      margin: EdgeInsets.only(top:ScreenAdaper.width(25)),
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
                onTap: (){
                  Navigator.of(context).push(	
                      MaterialPageRoute(
                        builder: (context)=>MessageCommentPage()  // --- 跳转搜索组件
                      )
                    );
                },
              )
            ),
          Row(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Container(
                width: ScreenAdaper.width(650),
                padding: EdgeInsets.only(left: ScreenAdaper.width(10)),
                alignment: Alignment.centerLeft,
                child: Text("愿未来所有的好时光都有你相伴，愿情话终有主，你我不再孤独",
                softWrap: true,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize:18),
                )
              )
            ],
            
          ),
          Stack(
            children: [
              Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child:Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset("assets/images/message.jpg"),
                        )
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child:Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset("assets/images/message1.png"),
                        )
                      ),
                      flex: 1,
                    ),

                    Expanded(
                      child:Container(
                        margin: EdgeInsets.all(3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Image.asset("assets/images/message2.jpg"),
                        )
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                padding: EdgeInsets.all(5),
                color: Color.fromRGBO(0, 0, 0, .5),
                child: Text("共10张",style: TextStyle(color: Colors.white60)),
              )
                
            ),
          ],
        ),


        Row(
          children: [
            Expanded(
              child: Text(""),
              flex: 6,
            ),
            Expanded(
              child: Icon(Icons.favorite_outline,size: 17),
              flex: 1,
            ),
            Expanded(
              child: Icon(Icons.thumb_up_off_alt,size: 17),
              flex: 1,
            ),
            Expanded(
              child: Icon(Icons.share,size: 17),
              flex: 1,
            )
          ]
        ),


       SizedBox(
         height: ScreenAdaper.height(35),
       ),
       

      ],
    )
    )
  );
}

class _FollowPageState extends State<FollowPage> {
  @override
  

Widget build(BuildContext context) {
    return Stack(
      children: [
         SingleChildScrollView(
          child: Column(
          children: [
            _userMessageCardWidget(),
            _userMessageCardWidget(),
            _userMessageCardWidget(),
            _userMessageCardWidget(),
          ],
        )
      ),

      Positioned(
        bottom: 15,
        right: 15,
        child: RoteFloatingButton(
          //菜单图标组
          iconList: [
            Icon(Icons.send,color: Colors.black54,),
            // Icon(Icons.mail_outline,color: Colors.black54,),
            Icon(Icons.face_retouching_natural ,color: Colors.black54,),
          ],
          //点击事件
          clickCallback: (int index){
           if(index==0){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> ReleasePageWidget()));
           }else if(index==1){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> GetReleasePageWidget()));
           }
            
          },
        ),
      )
            
    ],

      
    );
    

  }



  Widget _userMessageCardWidget(){
    return Card(
          margin: EdgeInsets.fromLTRB(5, 5, 10, 10),
          child:Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 10, 10),
            child: Column(
            children: [
              ListTile(
                leading: Container(
                  alignment: Alignment.centerLeft,
                  width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/images/avatar.jpg",fit: BoxFit.cover,),
                  ),
                ),
                title: Text("用户昵称"),
                subtitle: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right:35),
                      child: Row(children: [Icon(Icons.question_answer_outlined,size: 15,),Text(" 271")],),
                    ),
                    Text("1小时前"),
                  ],
                ),
                trailing:Container(
                  width: ScreenAdaper.width(120),
                  height: ScreenAdaper.height(50),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.blueAccent, width: 1),
                  ),
                  child:InkWell(
                    child: Text("关注",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueAccent
                      ),
                    ),
                  onTap: (){
                    
                    }
                  )
                )      
              ),

             Padding(
               padding: EdgeInsets.only(left:5),
               child:Row(
                
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Container(
                    width: ScreenAdaper.width(650),
                    padding: EdgeInsets.only(left: ScreenAdaper.width(10)),
                    alignment: Alignment.centerLeft,
                    child: Text("愿未来所有的好时光都有你相伴，愿情话终有主，你我不再孤独",
                    softWrap: true,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontSize:18),
                    )
                  )
                ],
              )
             ),

            Stack(
                children: [
                  Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child:Container(
                            margin: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.asset("assets/images/message.jpg"),
                            )
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child:Container(
                            margin: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.asset("assets/images/message1.png"),
                            )
                          ),
                          flex: 1,
                        ),

                        Expanded(
                          child:Container(
                            margin: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: Image.asset("assets/images/message2.jpg"),
                            )
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                    padding: EdgeInsets.all(5),
                    color: Color.fromRGBO(0, 0, 0, .5),
                    child: Text("共10张",style: TextStyle(color: Colors.white60)),
                    )
                    
                  ) 
                ],
              ),

              SizedBox(height:15),
              Row(
                children: [
                  Expanded(
                    child: Text(""),
                    flex: 6,
                  ),
                  Expanded(
                    child: Icon(Icons.favorite_outline,size: 17),
                    flex: 1,
                  ),
                  Expanded(
                    child: Icon(Icons.thumb_up_off_alt,size: 17),
                    flex: 1,
                  ),
                  Expanded(
                    child: Icon(Icons.share,size: 17),
                    flex: 1,
                  )
                ]
              ),

            ],
          ),
          )
        );
  }

}


   //底部浮动按钮
          