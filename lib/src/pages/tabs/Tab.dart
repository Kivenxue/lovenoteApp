import 'package:flutter/material.dart';
import 'package:lovenote/src/widget/navigation_icon_view.dart';

import '../tabs/Message.dart';
//引入 首页 
import 'Home.dart';
//引入活动页
// import 'Activity.dart'; 
//引入 社区页
import 'Commun.dart';
//引入 用户
import 'Message.dart';
import 'User.dart';
import 'Love.dart';




class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
    // var _currentIndex = 0;
    List<NavigationIconView> _navigationIconView;
    // ignore: non_constant_identifier_names
    List bottom_titles = ["我们", "恋爱", "消息","社区", "我"];
    // ignore: non_constant_identifier_names
    List bottom_icons = [
      "assets/icon/tab/home.png",
      // "assets/icon/tab/activity.png",
      "assets/icon/tab/pair.png",
      "assets/icon/tab/message.png",
      "assets/icon/tab/comm.png",
      "assets/icon/tab/me.png",
    ];
    // ignore: non_constant_identifier_names
    List bottom_select_icons = [
      "assets/icon/tab/home_check.png",
      // "assets/icon/tab/activity_check.png",
      "assets/icon/tab/pair_check.png",
      "assets/icon/tab/message_check.png",
      "assets/icon/tab/comm_check.png",
      "assets/icon/tab/me_check.png",
    ];

   int _currentIndex = 0;  //初始化下标 
    
   PageController _pageController;

   
    List<Widget>  _pageList=[
      HomePage(),
      LovePageWidget(),   
      // ActivityPage(),
      MessagePage(),
      CommunPage(),
      UserPage(),
];



  @override
  void initState(){
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);    
     _navigationIconView = [
      for (var i = _currentIndex; i < bottom_titles.length; i++)
        NavigationIconView(
            title: bottom_titles[i],
            icon: bottom_icons[i],
            activedIconPath: bottom_select_icons[i])
    ];
  }
  @override
    Widget build(BuildContext context) {

      return Scaffold(
        body:PageView(
          controller: this._pageController,
          children: this._pageList,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index){
            setState(() {
               this._currentIndex = index;
            });
            print(index);
          },
        ),

        // 添加位置
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor:Colors.white ,
          currentIndex: _currentIndex,
          items: _navigationIconView.map((view) => view.item).toList(),
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              this._pageController.jumpToPage(index); 
            });
          },

          // type:BottomNavigationBarType.fixed,
          fixedColor:Color.fromRGBO(214, 94, 158,.9)

        )


      );

    }

}