import 'package:flutter/material.dart';
import 'package:lovenote/pages/tabs/Message.dart';
//引入 首页 
import 'Home.dart';
//引入活动页
import 'Activity.dart'; 
//引入 社区页
import 'Commun.dart';
//引入 用户
import 'User.dart';

//


class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
   int _currentIndex = 0;  //初始化下标 
    
   PageController _pageController;

   
    List<Widget>  _pageList=[
      HomePage(),
      ActivityPage(),
      MessagePage(),
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
        // floatingActionButton: Container(
        //   height: 80,
        //   width: 80,
        //   padding: EdgeInsets.all(5),
        //   margin: EdgeInsets.only(top:20),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(40),
        //     color: Colors.white,
        //   ),
        //  child: FloatingActionButton(
        //     child: Icon(Icons.add,size: 30),
        //     onPressed: (){
        //       setState(() {
        //         this._currentIndex = 3;
        //       });
        //     },

        //     backgroundColor: this._currentIndex==4? Colors.blueAccent:Colors.blue
        //  ),
        // ),
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
          fixedColor:Colors.pinkAccent,

          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home), label:"我们"),
            BottomNavigationBarItem(icon: Icon(Icons.celebration), label:"活动"),
            BottomNavigationBarItem(
              icon: Icon(Icons.forum_outlined), 
              label:"消息"
            ),
            BottomNavigationBarItem(icon: Icon(Icons.video_library), label:"社区"),
            BottomNavigationBarItem(icon: Icon(Icons.face), label:"我"),
          ]

        )


      );

    }

}