import 'package:flutter/material.dart';
import '../pages/Activity.dart';
import '../pages/Commun.dart';
import '../pages/Home.dart';
import '../pages/Issue.dart';
import '../pages/Tab.dart';
import '../pages/User.dart';



final routes = {
  '/': (context) => Tabs(), 

  //home
  '/home':(context) => HomePage(),

  //活动
  '/activity':(context) => ActivityPage(),
  //发布
  '/issue':(context) => IssuePage(),

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
