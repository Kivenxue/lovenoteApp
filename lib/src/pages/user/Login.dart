import 'dart:async';

import 'dart:ui';

import 'package:emoji_picker/emoji_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}


class _LoginPageWidgetState extends State<LoginPageWidget> with TickerProviderStateMixin{

  //初始化函数中创建气泡
  @override
  void initState(){
    super.initState();
  }
  
  @override
  void dispose() {
    //销毁
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            child: Icon(Icons.close,color: Colors.black54,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ),

        ///填充布局
        body: Stack(
          children: [
            buildColumn(context)
          ],
        ),
      ),
      onTap: (){
        hindInputFouce();
      },
    );
  }


 //输入框
  Widget buildColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(44),
      child: Column(
        //子Widget 底部对齐
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         buildPhoneInputWidget(),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              buildPasswordInputWidget(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '忘记密码?',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),


        ],
      ),
    );
  }
}

 //隐藏输入
 void hindInputFouce(){
    SystemChannels.textInput.invokeMapMethod('TextInput.hide');
    _userPhoneFocusNode.unfocus();
    _userPasswordFocusNode.unfocus(); 
  }

 // 获取用户
 StreamController<String> _userPhoneStreamController = new StreamController();
 StreamController<String> _userPasswordStreamController = new StreamController();
 // 获取用户输入
 TextEditingController _userPhoneTextController = TextEditingController();
 TextEditingController _userPasswordTextController = TextEditingController();
 
 //抖动控制器
  ShakeAnimationController _userPhoneShakeController = ShakeAnimationController();
  ShakeAnimationController _userPasswordShakeController = ShakeAnimationController();
  //获取 焦点
  FocusNode _userPhoneFocusNode = new FocusNode();
  FocusNode _userPasswordFocusNode = new FocusNode();



  
  Widget buildPhoneInputWidget(){
    return Container(
    // margin: EdgeInsets.fromLTRB(28, 10,28, 10),
    child: StreamBuilder<String>(
      stream:_userPhoneStreamController.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return ShakeAnimationWidget(
          shakeAnimationType: ShakeAnimationType.LeftRightShake,
          isForward: false,
          shakeCount: 0,
          shakeRange: 0.2,   
          shakeAnimationController:_userPhoneShakeController,
          child: TextField(
            controller: _userPhoneTextController,
            focusNode: _userPhoneFocusNode,
                 style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                ),
                //输入框的边框
                decoration: InputDecoration(
                  //提示文本
                  labelText: "请输入电话/邮箱",
                  //提示文本的样式
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  //可编辑时的提示文本的颜色
                  
                  focusColor: Colors.blueGrey,
                  border:OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  errorText: snapshot.data,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink[200]),
                  ),
                  //填充
                  filled: true,
                  //可编辑时 无边框样式
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

                  //获取输入焦点时的边框样式
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink[200]),
                  ),

                  //文本前置的图标
                  prefixIcon: Icon(
                    Icons.phone_android_outlined,
                    size: 18,
                    color: Colors.pink[300],
                  ),
                ),
                onSubmitted: (String value){
                  print(value);
                  if(!checkUserPhone()){
                    print(checkUserPhone());
                    _userPhoneFocusNode.unfocus();
                  }else{
                    FocusScope.of(context).requestFocus(_userPasswordFocusNode);
                  }
                },
          ),

        );
      }
    )
    );
  }

  bool checkUserPhone(){
    String phone = _userPhoneTextController.text;
    if(phone.length == 0){
      _userPhoneStreamController.add("用户名不允许为空");
      //输入抖动
      _userPhoneShakeController.start();
      return false;
    }else{
      _userPhoneStreamController.add(null);
      return true;
    }
  }

  Widget buildPasswordInputWidget(){
    return Container(
    // margin: EdgeInsets.fromLTRB(28, 10,28, 10),
    child:StreamBuilder<String>(
      stream: _userPasswordStreamController.stream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return ShakeAnimationWidget(
          shakeAnimationType: ShakeAnimationType.LeftRightShake,
          isForward: false,
          shakeCount: 0,
          shakeRange: 0.2,   
          shakeAnimationController:_userPasswordShakeController,
          child: TextField(
            controller: _userPasswordTextController,
            focusNode: _userPasswordFocusNode,
                 style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.0,
                ),
                //输入框的边框
                decoration: InputDecoration(
                  //提示文本
                  labelText: "请输入登录密码",
                  //提示文本的样式
                  labelStyle: TextStyle(color: Colors.blueGrey),
                  //可编辑时的提示文本的颜色
                  focusColor: Colors.blueGrey,
                  //填充
                  filled: true,
                  border:OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  errorText: snapshot.data,

                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink[200]),
                  ),
                  //可编辑时 无边框样式
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),

                  //获取输入焦点时的边框样式
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.pink[200]),
                  ),
                  //文本前置的图标
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 18,
                    color: Colors.pink[300],
                  ),
                  suffixIcon:Icon(
                      Icons.visibility,
                      size: 18,
                      color: Colors.purple[200],
                  )
                ),

                onSubmitted: (String value){
                  print(value);
                  if(!checkUserPassword()){
                    _userPasswordFocusNode.unfocus();
                  }else{
                    // FocusScope.of(context).requestFocus(_userPasswordFocusNode);
                  }
                },
          ),

        );
      }
    )
    );
  }


  bool checkUserPassword(){
    String phone = _userPasswordTextController.text;
    if(phone.length == 0){
      _userPasswordStreamController.add("密码不允许为空");
      //输入抖动
      _userPasswordShakeController.start();
      return false;
    }else{
      _userPasswordStreamController.add(null);
      return true;
    }
  }


  Widget buildLoginButton(){
    return Container(
      margin: EdgeInsets.fromLTRB(28, 5,28, 10),
      width: double.infinity,
      color: Colors.pink[100],
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black54)
        ),
        onPressed: (){
          // CheckCodeButtonFuntion();
        },
        child: Text("登录"),
      ),
    );
  }
