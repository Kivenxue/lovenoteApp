import 'package:flutter/material.dart';
import 'package:lovenote/src/pages/user/Login.dart';
import 'package:lovenote/src/runapp/is_userinfo.dart';


//生成动态控件
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//混入动态组件
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {//------1
  //声明
  AnimationController _controller;
  Animation _animation;
  //控制动画

  //初始化状态
  @override
  void initState() {  //------2
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));  //------3  闪屏时长
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller); //动画放入
    //动画结束监听事件
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {		
        //        ------------ 跳转下一页 结束掉
        Navigator.of(context).pushAndRemoveUntil(  //------4 跳转屏幕路由
            MaterialPageRoute(builder: (context) => IsUserInfo()),
            (route) => route == null);
      }
    });

    _controller.forward(); //控制器播放动画			
  }

  //销毁后
  @override
  void dispose() {
    _controller.dispose();				//------5 销毁控制器
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(   //------6  添加透明过渡控件
      opacity: _animation,//添加
      child: Image.asset('assets/images/splansh_bg.png',scale: 2.0,fit: BoxFit.cover),//铺满外部容器
    );
  }
}


