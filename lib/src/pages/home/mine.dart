import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  String bgUrl = "images/hbg.jpg";

  PanelController panel = new PanelController();
  double offsetDistance = 0.0;
  double offsetY = 0;
  double maxHeight = 801; //最大展开高度
  double minHeight = 200; //最小收缩高度


  Widget _LoveDateWidget(){
    return Column(
      children: [
        SizedBox(height:ScreenAdaper.height(150)),
        Center(
          child: Container(
            
            width: ScreenAdaper.width(700.0),
            height: ScreenAdaper.height(150.0),
            
            decoration: BoxDecoration(
            //背景
            color: Colors.white54,
            //设置四周圆角 角度
            borderRadius:
                BorderRadius.all(Radius.circular(4.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset('assets/images/avatar.jpg',
                            width: ScreenAdaper.width(100),
                            fit: BoxFit.cover),
                      ))
                    ],
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "💕相恋",
                        style: TextStyle(
                            fontSize: 18, color: Colors.black),
                      ),
                      Text(
                        "50 天",
                        style: TextStyle(
                            fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset('assets/images/avatar2.jpg',
                            width: ScreenAdaper.width(100),
                            fit: BoxFit.cover),
                      ))
                    ],
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
        )
      ],
    );
  }

  //用户模块
  Widget _UserFuncDataWidget(){
    return Container(
          margin: EdgeInsets.only(top:9),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [        
            Column(
              children: [
                Container(
                  margin:EdgeInsets.fromLTRB(25, 35, 25, 0),
                  width: ScreenAdaper.width(80),
                  child:Image.asset("assets/icon/diary.png",fit: BoxFit.cover),
                ),
                Text("日记")
              ],
            ),
            Column(
              children: [
                Container(
                  margin:EdgeInsets.fromLTRB(25, 35, 25, 0),
                  width: ScreenAdaper.width(80),
                  child:Image.asset("assets/icon/photo.png",fit: BoxFit.cover),
                ),
                Text("相册")
              ],
            ),
            Column(
              children: [
                Container(
                  margin:EdgeInsets.fromLTRB(25, 35, 25, 0),
                  width: ScreenAdaper.width(80),
                  child:Image.asset("assets/icon/sing.png",fit: BoxFit.cover),
                ),
                Text("签到")
              ],
            ),
            Column(
              children: [
                Container(
                  margin:EdgeInsets.fromLTRB(25, 35, 25, 0),
                  width: ScreenAdaper.width(80),
                  child:Image.asset("assets/icon/more.png",fit: BoxFit.cover),
                ),
                Text("更多")
              ],
            ),
          ]
        ),
        
        );
  }


  
  Widget _Base(){
    return Container(
          color: Colors.pinkAccent,
          child: Column(
            children: [
              Container(
                  child: Row(  
                    children: [
                    Container(
                        width: 30,
                        child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover),
                      ),
                      Expanded(
                      child: Column(
                        children: [
                          Text("用户昵称"),
                          Text("2021年12月21日")
                        ],
                      ),
                        flex: 1,
                      ),
                      Expanded(
                      child:  Container(
                          child: Text("***"),
                        ),
                        flex: 1,
                      ),
                    
                  ],
                ),
              ),
              
              Row(),
              Row(),
            ],
          ),
      );
  }
  
  
  
  //
  Widget _UserDiaryCardWdiget(){
    return Container(

    child: Column(
      children: [
         Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Container(
                      width: 40,
                      child: Image.asset("assets/images/avatar.jpg",fit: BoxFit.cover,),
                    ),
                    title: Text("用户昵称"),
                    subtitle: Text("2020年1月29日"),
                    trailing:Icon(Icons.more_horiz,size:32)
                  ),
                  Divider(color: Colors.grey),
                  Container(
                    width: 250,
                    height: 200,
                    margin: EdgeInsets.only(bottom:20),
                    child: Image.asset("assets/images/message.jpg",fit: BoxFit.cover,),
                  ),
                  Container(
                    margin: EdgeInsets.only(left:60),
                    child: Row(
                    children: [
                        Expanded(
                          child: Text("234234"),
                          flex: 1,
                        )
                      ],
                    )
                  )
                ],
              )
          ),
         
      ],
    )
       
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/hbg.jpg"),
              fit: BoxFit.cover
            ),
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
  
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
                child: new ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Stack(
                      children: [
                        _LoveDateWidget()
                      ],
                    )),
                onTap: () {
                  panel.close();
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
                _UserFuncDataWidget(),
                SizedBox(height:ScreenAdaper.height(35)),
                //用户日记
                Container(
                  width: double.infinity,
                  color: Color.fromARGB(240, 247, 247, 247),
                  child: _UserDiaryCardWdiget(),
                )
                
                ],
              )
            ),
          )
      );

  }
}

