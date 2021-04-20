import 'package:flutter/material.dart';
import 'package:lovenote/pages/home/mine.dart';
import 'package:lovenote/pages/home/moving.dart';
import '../pages/tabs/Activity.dart';
import '../pages/tabs/Home.dart';
import '../pages/tabs/Commun.dart';
import '../pages/tabs/Message.dart';
import '../pages/tabs/Tab.dart';
import '../pages/tabs/User.dart';

//Message 
import '../pages/message/messagedetail.dart';
final routes = {
  '/': (context) => Tabs(), 
  
  //home
  '/home':(context) => HomePage(),
  '/moving':(context) => MovingPage(),
  '/mine':(context) => MinePage(),
  //活动
  '/activity':(context) => ActivityPage(),

  //消息
  '/message':(context) => MessagePage(),
  '/messageDetail':(context) => MessageDetailPage(),

  //社区
  '/commun':(context) => CommunPage(),

  //我的
  '/user':(context) => UserPage()
  

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
