import 'package:flutter/material.dart';

class UserInfoPageWidget extends StatefulWidget {
  @override
  _UserInfoPageWidgetState createState() => _UserInfoPageWidgetState();
}

class _UserInfoPageWidgetState extends State<UserInfoPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left:90),
          child: Text("个人资料",style: TextStyle(color: Colors.black)),
        ),
        leading:InkWell(
          child:Container(
            margin: EdgeInsets.only(left:20),
            child: Icon(Icons.arrow_back_ios,color: Colors.black26,)
          ),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Card(
              child:Padding(
                padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text("头像"),
                      flex: 1,
                    ),
                    Container(
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/images/avatar.jpg",fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: Icon(Icons.chevron_right,color: Colors.black45,),
                    )
                 ],
              ),
              )
            ),
            Card(
              margin: EdgeInsets.only(top:15),
              child: Column(
                children: [
                  //组件待抽离 --------- Start

                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Row(
                      children: [
                        Expanded(
                          child: Text("昵称"),
                          flex: 1,
                        ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Text("无力"),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.chevron_right,color: Colors.black45,),
                        )
                      ],
                    ),
                  ),

                  Divider(color: Colors.grey[400],height: 1,),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Row(
                      children: [
                        Expanded(
                          child: Text("性别"),
                          flex: 1,
                        ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Text("男"),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.chevron_right,color: Colors.black45,),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[400],height: 1,),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Row(
                      children: [
                        Expanded(
                          child: Text("手机号"),
                          flex: 1,
                        ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Text("123"),
                          ),
                        ),
                        Container(
                          child: Icon(Icons.chevron_right,color: Colors.black45,),
                        )
                      ],
                    ),
                  ),

                  //组件待抽离 --------- End
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}