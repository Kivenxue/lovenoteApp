
import 'package:flutter/material.dart';
import 'package:lovenote/src/pages/home/mine.dart';
import 'package:lovenote/src/pages/home/moving.dart';
import 'package:lovenote/src/pages/message/addFriend.dart';
import 'package:lovenote/src/pages/user/SecondRegister.dart';
import 'package:lovenote/src/pages/user/Setting.dart';
import 'package:lovenote/src/runapp/index_page.dart';
import 'package:lovenote/src/runapp/splansh_screen.dart';
import 'package:lovenote/src/pages/love/love_daily.dart';
import 'package:lovenote/src/pages/love/love_pair.dart';// 

// 
import '../pages/tabs/Activity.dart';
import '../pages/tabs/Home.dart';
import '../pages/tabs/Commun.dart';
import '../pages/tabs/Message.dart';
import '../pages/tabs/Tab.dart';
import '../pages/tabs/User.dart';

//Message  消息组件
import '../pages/message/message_detail.dart';
//Comment 社区组件
import '../pages/commun/messagComment.dart';

//Login  用户登录
import '../pages/user/Login.dart';
//Register 用户注册页
import '../pages/user/Register.dart';

final routes = {
  '/': (context) => Tabs(), 
  
  //home
  '/home':(context) => HomePage(),
  '/moving':(context) => MovingPage(),
  '/mine':(context) => MinePage(),

  //恋爱
  '/loveDaily':(context) => LoveDailyPageWidget(),
  '/lovePair':(context) => LovePairPageWidget(),
  //活动
  '/activity':(context) => ActivityPage(),

  //消息
  '/message':(context) => MessagePage(),
  '/messageDetail':(context) => MessageDetailPage(),
  //添加好友
  '/addFriend':(context) => AddFriendPageWidget(),

  //社区
  '/commun':(context) => CommunPage(),
  '/messagComment':(context) => MessageCommentPage(),

  //我的
  '/user':(context) => UserPage(),
  '/setting':(context) => SettingPageWidget(),
  '/login':(context) => LoginPageWidget(),
  '/register':(context) => RegisterPageWidget(),
  '/secondRegister':(context) => SecondRegister(),



  //启动页
  '/index':(context) => IndexPage(),
  '/splash' :(context)=>SplashScreen()
  
  };




//固定写法
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
