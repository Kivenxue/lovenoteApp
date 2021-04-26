import 'package:flutter/material.dart';

//自定义底部导航栏itme
class NavigationIconView {
  final BottomNavigationBarItem item;
  //标题
  final String title;
  //图标
  final String icon;
  //选中图标路径
  final String activedIconPath;

  NavigationIconView(
      {@required this.title,
      @required this.icon,
      @required this.activedIconPath,
      
      })
      : item = BottomNavigationBarItem(
            //默认图标
            icon: Image.asset(
              icon,
              width: 20,
              height: 20,
            ),
            //选中状态
            activeIcon: Image.asset(
              activedIconPath,
              width: 22,
              height: 22,
            ),
            label: title
            

      );
}
