import 'package:flutter/material.dart';
import 'package:lovenote/src/pages/user/Setting.dart';
import 'package:lovenote/src/pages/user/total/user_info.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';


class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);
  @override
  _UserPageState createState() => _UserPageState();
}


_UserInfoWidget(context){
    return Stack(
      children: [
      Container(
        height: 250,
        child: Image.asset("assets/images/user_bg.png",width: double.infinity ,fit:BoxFit.cover),
      ),
      InkWell(
        child:  Container(
        margin: EdgeInsets.only(top:175),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, .8),
        ),
        child:  Row(
          children: <Widget>[               
                Expanded(
                    child:  Container(
                      padding: EdgeInsets.all(ScreenAdaper.width(15)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child:Image.asset("assets/images/avatar.jpg",
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
                      style: TextStyle(color: Colors.grey,fontSize: 13),
                      )
                      ],
                    ),
                  flex: 3
                  ),
                  InkWell(
                    child: Expanded(
                    child: Row(
                        children: [
                          Text("个人资料",style: TextStyle(color: Colors.black38),),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.chevron_right,color: Colors.grey),
                          ),
                        ],
                      ),
                    flex: 1
                    ),
                  )
              ],
            ),
        ),
        onTap: (){
          Navigator.push(context,   MaterialPageRoute(builder: (context) => new UserInfoPageWidget()));
        },
      )
      ],
    );
}



_UserGridWidget(){
  return Card(
    margin: EdgeInsets.all(10),
    child:  Container(
    padding: EdgeInsets.fromLTRB(ScreenAdaper.width(10), 0, ScreenAdaper.width(10), ScreenAdaper.width(10)),
    child: Row(
    children: [
       Expanded(
            child:Column(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  child:Container(
                    height: 30,
                    child: Image.asset("assets/icon/user_addtime.png"),
                  ),
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
                  padding: EdgeInsets.all(7),
                  child: Container(
                    height: 30,
                    child: Image.asset("assets/icon/user_theme.png"),
                  ),
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
                  padding: EdgeInsets.all(7),
                  child:Container(
                    height: 30,
                    child: Image.asset("assets/icon/user_image.png"),
                  ),
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
                  margin: EdgeInsets.fromLTRB(7, 8, 7, 7),
                    child:Container(
                    height: 30,
                    child: Image.asset("assets/icon/user_game.png"),
                  ),
                ),
                Text("小游戏")
              ],
            ),
            flex: 1,
          ),
          
      ])
    )
  );
}


_UserListDataWidget(BuildContext context){
  return Container(
    margin: EdgeInsets.all(5),
    child: Column(
      children: <Widget>[   
        
        
        Card(
          child: ListTile(
          leading: Icon(Icons.description_outlined,color: Colors.blueAccent,),
          title:Text("恋爱登记",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey),
          ),
        ),

        Card(
          child: ListTile(
          leading: Icon(Icons.local_offer_outlined,color: Colors.blueAccent,),
          title:Text("标签",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey),
          ),
        ),

        Card(
          child: ListTile(
          leading: Icon(Icons.headset_mic,color: Colors.blueAccent,),
          title:Text("在线客服",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey),
          ),
        ),

       Card(
          child: ListTile(
          leading: Icon(Icons.auto_fix_normal,color: Colors.blueAccent,),
          title:Text("用户反馈",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined,color: Colors.grey),
          ),
        ),
        
        InkWell(
          child: Card(
          child: ListTile(
          leading: Icon(Icons.settings,color: Colors.blueAccent,),
          title: Text("设置",style: TextStyle(fontSize: 15)),
          trailing: Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ),
        onTap: (){
           Navigator.of(context).push(	
            MaterialPageRoute(
              builder: (context)=>SettingPageWidget()  // --- 跳转搜索组件
            )
          );
        },
        ),
        
      ],
    ),
  );
  
}

// _UserListDataWidget(){}

class _UserPageState extends State<UserPage> with AutomaticKeepAliveClientMixin{
  
  PanelController panel = new PanelController();
  double offsetDistance = 0.0;
  double offsetY = 0;
  double maxHeight = 810; //最大展开高度
  double minHeight = 550; //最小收缩高度
  bool isTageHeight = true;
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; 

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       
        body:Container(
  
        child: Center(
            child: SlidingUpPanel(
              controller: panel,
              minHeight: minHeight,
              maxHeight: maxHeight,
              parallaxEnabled: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              body: GestureDetector(
                child:Stack(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: new Image.asset(
                      "assets/images/top3.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                   Positioned(
                     bottom: 0,
                     child:Container(
                      padding: EdgeInsets.only(top:10),
                      // color: Color.fromRGBO(255, 255, 255, .5),
                      height: 705,
                      width: 1334,
                      child: ListTile(
                        leading:Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child:Image.asset("assets/images/avatar.jpg",
                            fit: BoxFit.cover),
                          ),
                        ),
                        title: Text("无力", style: TextStyle(color: Colors.white54),),
                        subtitle: Text(
                          "个性签名",
                          style: TextStyle(color: Colors.black45),
                        ),
                      )
                    ),
                   )
                  ],
                ),
                onTap: (){
                  panel.close();
                  Navigator.push(context,   MaterialPageRoute(builder: (context) => new UserInfoPageWidget()));
                },
                
                onVerticalDragDown: (details) {
                  // print(details.globalPosition.dy);
                  offsetDistance = details.globalPosition.dy;
                },
                onVerticalDragUpdate: (details) {
                  offsetY = details.globalPosition.dy - offsetDistance;
                  if (offsetY > 0) {
                    print("向下" + offsetY.toString());
                  } else {
                    print("向上" + offsetY.toString());
                    double position = offsetY.abs() / 300;
                    position = position > 1 ? 1 : position;
                    panel.setPanelPosition(position);
                    if (position > 0.4) {
                      panel.open();
                    }
                  }
                },
              ),
              
              panel: Column(
                children: <Widget>[
                 _UserGridWidget(),
                 _UserListDataWidget(context)
                ],
              )
            ),
          )
      )
     );

  }
}



//  _UserInfoWidget(context),
//   _UserGridWidget(),
//   _UserListDataWidget(context)