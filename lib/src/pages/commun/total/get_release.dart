import 'package:flutter/material.dart';
class GetReleasePageWidget extends StatefulWidget {
  @override
  _GetReleasePageWidgetState createState() => _GetReleasePageWidgetState();
}

class _GetReleasePageWidgetState extends State<GetReleasePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left:85),
          child: Text("我的社区",style: TextStyle(color: Colors.black)),
        ),
        leading:InkWell(
          child:Container(
            margin: EdgeInsets.only(left:10),
            child: Icon(Icons.arrow_back_ios,color: Colors.black26,)
          ),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Card(
            child:Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(8, 20, 8, 20),
                      width: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover,),
                      )
                    ),
                    Positioned(
                      bottom: 20,
                      right: 3,
                      child: Container(
                        width: 18,
                        child: Image.asset('assets/icon/sex_0.png',fit: BoxFit.contain),
                      ),
                    )
                  ],
              ),  
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right:20),
                  alignment: Alignment.centerRight,
                  child: Text("用户信息"),
                ),
                flex: 1,
              )              
            ],
            ),
          ),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 20,
                    height: 20,
                  ),
                  title: Text("我的帖子"),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black45,),
                ),
                Divider(color: Colors.grey,height: 1,),
                ListTile(
                  leading: Container(
                    width: 20,
                    height: 20,
                  ),
                  title: Text("我的收藏"),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black45,),
                ),
                Divider(color: Colors.grey,height: 1,),
                 ListTile(
                  leading: Container(
                    width: 20,
                    height: 20,
                  ),
                  title: Text("我的回复"),
                  trailing: Icon(Icons.chevron_right_outlined,color: Colors.black45,),
                ),
                Divider(color: Colors.grey,height: 1,),
              ],
            )
          ),
          Card(
            child: ListTile(
              leading: Container(
                width: 20,
                height: 20,
              ),
              title: Text("我的关注"),
              trailing: Icon(Icons.chevron_right_outlined,color: Colors.black45,),
            ),
          ),
          
        ],
      ),
    );
  }
}