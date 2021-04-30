import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jverify/jverify.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';


class RegisterPageWidget extends StatefulWidget {

  RegisterPageWidget({Key key}) : super(key: key);

  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {

  //实例化极光验证的插件
  Jverify jverify = new Jverify();

  //是否支持验证
  bool _supportJverify = true;

  //是否显示圈圈
  bool _loading = false;

  //返回的结果
  String _result = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化插件
    this._initJverify();

    //检测网络是否支持
    this._checkVerifyEnable();
  }


  //初始化插件的方法
  void _initJverify() {
    jverify.setDebugMode(true); // 打开调试模式
    jverify.setup(
        appKey: "85429874008ad3da77142b9b",
        channel: "devloper-default"); // 初始化sdk,  appKey 和 channel 只对ios设置有效
  }

  //判断当前的手机网络环境是否可以使用认证
  void _checkVerifyEnable() {
    jverify.checkVerifyEnable().then((map) {
      bool result = map["result"];
      if (result) {
        print("当前网络环境支持认证");
        this.setState(() {
          this._supportJverify = true;
        });
      } else {
        print("当前网络环境不支持认证");
        this.setState(() {
          this._supportJverify = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child:Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left:100),
          child: Text("注册",style: TextStyle(color: Colors.black)),
        ),
        leading:InkWell(
          child:Container(
            margin: EdgeInsets.only(left:20),
            child: Icon(Icons.arrow_back_ios,color: Colors.black26,)
          ),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body:buildBody()
      )
    );
  }

  Widget buildBody(){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //Logo
        //---------- 本机号一键登录
        SizedBox(height:10),
        _supportJverify?
        // buildLocalAccountButton(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black54)
          ),
          child: Text('一键授权登录'),
          onPressed: () {
            // this.loginAuth();
          },
        ):ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black54)
          ),
          child: Text('普通登录'),
          onPressed: () {
            print("普通登录");
          },
        ),

        Container(
          margin: EdgeInsets.fromLTRB(28, 5,28, 10),
          child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [ 
              Text(
                "其他方式登录",
                style: TextStyle(
                  fontSize: 15,
                  color:  Colors.pinkAccent
                ),
              )
            ],
          )
        )
       ],
      ),
    );
  }





  Widget buildLocalAccountButton(){
    return Container(
      margin: EdgeInsets.fromLTRB(28, 5,28, 10),
      width: double.infinity,
      color: Colors.black26,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black54)
        ),
        onPressed: (){
          // CheckCodeButtonFuntion();
        },
        child: Text("本机号码一键授权登录"),
      ),
    );
  }



 
}

