import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';

class FreshPage extends StatefulWidget {
  @override
  _FreshPageState createState() => _FreshPageState();
}

class _FreshPageState extends State<FreshPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
        ),
      ],
    );
  }
}