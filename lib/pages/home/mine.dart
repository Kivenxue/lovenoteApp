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
                        child: Image.asset('images/avatar.jpg',
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
                        child: Image.asset('images/avatar2.jpg',
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

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/hbg.jpg"),
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
              panel: Container(
                child: Center(
                  child: Text("评论区",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none
                      )
                    ),
                ),
              ),
            ),
          )
      );

  }
}

