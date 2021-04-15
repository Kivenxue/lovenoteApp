import 'package:flutter/material.dart';
//引入 首页 
import 'Home.dart';
//引入活动页
import 'Activity.dart'; 
//引入 社区页
import 'Commun.dart';
//引入 发布
import 'Issue.dart';
//引入 用户
import 'User.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
   int _currentIndex = 1;  //初始化下标 
    
   PageController _pageController;

   
    List<Widget>  _pageList=[
      HomePage(),
      ActivityPage(),
      IssuePage(),
      CommunPage(),
      UserPage()
    ];



  @override
  void initState(){
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);    
    
  }
  @override
    Widget build(BuildContext context) {

      return Scaffold(
        body:PageView(
          controller: this._pageController,
          children: this._pageList,
          onPageChanged: (index){
            setState(() {
              this._currentIndex = index;
            });
          },
        ),

        //浮动按钮
        floatingActionButton: Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(top:20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
         child: FloatingActionButton(
            child: Icon(Icons.add,size: 30),
            onPressed: (){
              setState(() {
                this._currentIndex = 2;
              });
            },

            backgroundColor: this._currentIndex==2? Colors.blueAccent:Colors.blue
         ),
        ),
        // 添加位置
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap:(int index){
            setState(() {
              this._currentIndex = index;
              this._pageController.jumpToPage(index);
            });
          },
          type:BottomNavigationBarType.fixed,
          fixedColor:Colors.blue,
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(Icons.celebration), title: Text("活动")),
            BottomNavigationBarItem(icon: Icon(Icons.maps_ugc), title: Text("发布")),
            BottomNavigationBarItem(icon: Icon(Icons.video_library), title: Text("社区")),
            BottomNavigationBarItem(icon: Icon(Icons.face), title: Text("我的")),
          ]

        )


      );

    }

}