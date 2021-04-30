import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jverify/jverify.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';


class IsUserInfo extends StatefulWidget {

  IsUserInfo({Key key}) : super(key: key);

  @override
  _IsUserInfoState createState() => _IsUserInfoState();
}

class _IsUserInfoState extends State<IsUserInfo> {
  //极光认证插件
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


  
 //授权登录
 void loginAuth() {
    jverify.checkVerifyEnable().then((map) {
      bool result = map["result"];

      if (result) {
        final screenSize = MediaQuery.of(context).size;
        final screenWidth = ScreenAdaper.getScreenWidth();
        final screenHeight =ScreenAdaper.getScreenHeight();

        bool isiOS = Platform.isIOS; 
        JVUIConfig uiConfig = JVUIConfig();
              
        //uiConfig.navHidden = true;
        uiConfig.navColor = Colors.pink[200].value;
        uiConfig.navText = "一键登录";
        

        uiConfig.navTextColor = Colors.white.value;
        uiConfig.navReturnImgPath = "return_bg"; //图片必须存在

        uiConfig.logoWidth = 100;
        uiConfig.logoHeight = 100;
        //uiConfig.logoOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.logoWidth/2).toInt();
        uiConfig.logoOffsetY = 10;
        uiConfig.logoVerticalLayoutItem = JVIOSLayoutItem.ItemSuper;
        uiConfig.logoHidden = false;
        uiConfig.logoImgPath = "logo";

        uiConfig.numberFieldWidth = 200;
        uiConfig.numberFieldHeight = 40;
        //uiConfig.numFieldOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.numberFieldWidth/2).toInt();
        uiConfig.numFieldOffsetY = isiOS ? 20 : 120;
        uiConfig.numberVerticalLayoutItem = JVIOSLayoutItem.ItemLogo;
        uiConfig.numberColor = Colors.black.value;
        uiConfig.numberSize = 18;

        uiConfig.sloganOffsetY = isiOS ? 20 : 160;
        uiConfig.sloganVerticalLayoutItem = JVIOSLayoutItem.ItemNumber;
        uiConfig.sloganTextColor = Colors.black.value;
        uiConfig.sloganTextSize = 15;


        uiConfig.logBtnWidth = 220;
        uiConfig.logBtnHeight = 50;
        //uiConfig.logBtnOffsetX = isiOS ? 0 : null;//(screenWidth/2 - uiConfig.logBtnWidth/2).toInt();
        uiConfig.logBtnOffsetY = isiOS ? 20 : 230;
        uiConfig.logBtnVerticalLayoutItem = JVIOSLayoutItem.ItemSlogan;
        uiConfig.logBtnText = "授权一键登录";
        uiConfig.logBtnTextColor = Colors.white.value;
        uiConfig.logBtnTextSize = 16;
        uiConfig.loginBtnNormalImage = "login_btn_normal"; //图片必须存在
        uiConfig.loginBtnPressedImage = "login_btn_press"; //图片必须存在
        uiConfig.loginBtnUnableImage = "login_btn_unable"; //图片必须存在

        uiConfig.privacyHintToast =
            true; //only android 设置隐私条款不选中时点击登录按钮默认显示toast。

        uiConfig.privacyState = true; //设置默认勾选
        uiConfig.privacyCheckboxSize = 20;
        uiConfig.checkedImgPath = "check_image"; //图片必须存在
        uiConfig.uncheckedImgPath = "uncheck_image"; //图片必须存在
        uiConfig.privacyCheckboxInCenter = true;
        //uiConfig.privacyCheckboxHidden = false;

        //uiConfig.privacyOffsetX = isiOS ? (20 + uiConfig.privacyCheckboxSize) : null;
        uiConfig.privacyOffsetY = 15; // 距离底部距离
        uiConfig.privacyVerticalLayoutItem = JVIOSLayoutItem.ItemSuper;
        uiConfig.clauseName = "恋爱登记";
        //app a
        uiConfig.clauseUrl = "http://www.itying.com";
        uiConfig.clauseBaseColor = Colors.black.value;

        uiConfig.authStatusBarStyle = JVIOSBarStyle.StatusBarStyleDarkContent;
        uiConfig.privacyStatusBarStyle = JVIOSBarStyle.StatusBarStyleDefault;
        uiConfig.modelTransitionStyle =
            JVIOSUIModalTransitionStyle.CrossDissolve;

        uiConfig.statusBarColorWithNav = true;
        uiConfig.virtualButtonTransparent = true;

        uiConfig.privacyStatusBarColorWithNav = true;
        uiConfig.privacyVirtualButtonTransparent = true;

        uiConfig.needStartAnim = true;
        uiConfig.needCloseAnim = true;

        uiConfig.privacyNavColor = Colors.red.value;
        ;
        uiConfig.privacyNavTitleTextColor = Colors.white.value;
        uiConfig.privacyNavTitleTextSize = 16;

        uiConfig.privacyNavTitleTitle = "ios lai le"; //only ios
        uiConfig.privacyNavTitleTitle1 = "协议1-itying";
        // uiConfig.privacyNavTitleTitle2 = "协议22 web页标题";
        uiConfig.privacyNavReturnBtnImage = "return_bg"; //图片必须存在;


        //自定义组件----
        final String text_widgetId = "jv_add_custom_text";// 标识控件 id
        JVCustomWidget textWidget = JVCustomWidget(text_widgetId, JVCustomWidgetType.textView);
        textWidget.title = "其他登录方式";
        textWidget.left = ((screenWidth-100)/2).toInt();
        textWidget.top = 360 ;
        textWidget.width = 100;
        textWidget.height  = 40;
        // textWidget.backgroundColor = Colors.yellow.value;
        textWidget.isShowUnderline = true;
        textWidget.textAlignment = JVTextAlignmentType.center;
        textWidget.isClickEnable = true;

        // 添加点击事件监听
        jverify.addClikWidgetEventListener(text_widgetId, (eventId) {
          print("receive listener - click widget event :$eventId");
          if (text_widgetId == eventId) {
            // print("receive listener - 点击【新加 text】");
            //关闭当前授权页面
            jverify.dismissLoginAuthView();
            //其他登录方式 
            Navigator.pushNamed(context, '/device');
          }
        });



        /// 添加自定义的 控件 到授权界面
        List<JVCustomWidget> widgetList = [
         textWidget
        ];

        /// 步骤 1：调用接口设置 UI
        jverify.setCustomAuthorizationView(true, uiConfig,
            landscapeConfig: uiConfig, widgets: widgetList);

        /// 步骤 2：调用一键登录接口
        /// 方式一：使用同步接口 （如果想使用异步接口，则忽略此步骤，看方式二）
        /// 先，添加 loginAuthSyncApi 接口回调的监听
        jverify.addLoginAuthCallBackListener((event) {
          setState(() {
            _loading = false;
            _result = "监听获取返回数据：[${event.code}] message = ${event.message}";
          });
          print(
              "通过添加监听，获取到 loginAuthSyncApi 接口返回数据，code=${event.code},message = ${event.message},operator = ${event.operator}");
        });

        /// 再，执行同步的一键登录接口
        jverify.loginAuthSyncApi(autoDismiss: true);
      } else {
        setState(() {
          _loading = false;
          _result = "[2016],msg = 当前网络环境不支持认证";
        });
      }
    });
  }






  bool isClickLogin=false;
  bool isClickRegister=false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //定义背景图片
        buildImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top:150),
              width: 150,
              child: Image.asset("assets/icon/login_bg.png",fit: BoxFit.cover),
            ),
          ],
        ),
        buildButton(context),
      ],
    );
    
  }

  buildImage() {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/welcome_bg.gif",
        fit: BoxFit.fill,
      ),
    );
  } 



  Positioned buildButton(BuildContext context){
    return Positioned(
      bottom: 90,
      left: 0,
      right: 0,
      child: Column(
           children: [
           Container(
              margin: EdgeInsets.fromLTRB(100, 10, 100, 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue, Colors.red]),// 渐变色
                  borderRadius: BorderRadius.circular(25)
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                color: Colors.transparent, // 设为透明色
                elevation: 0, // 正常时阴影隐藏
                highlightElevation: 0, // 点击时阴影隐藏
                onPressed: (){
                  setState(() {
                    isClickLogin=!isClickLogin;
                    print(isClickLogin);
                  });
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: Text('登录', style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 10, 100, 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.blueAccent]),// 渐变色
                  borderRadius: BorderRadius.circular(25)
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                color: Colors.transparent, // 设为透明色
                elevation: 0, // 正常时阴影隐藏
                highlightElevation: 0, // 点击时阴影隐藏
                onPressed: (){
                  this.loginAuth();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: Text('注册', style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
           Container(
             width: 300,
             child:Row(
                children: <Widget>[
                    Expanded(
                        child: Divider(color: Colors.white60,),
                    ),   

                    Text(" 快捷登录 ",style: TextStyle(
                      color: Colors.white54, 
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      )
                    ),        
                    Expanded(
                        child: Divider(color: Colors.white60,),
                    ),  
                  ]
                )
            ),
           SizedBox(height:20),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                   width: 40,
                   child:Image.asset("assets/icon/qq.png",fit: BoxFit.cover),
                 ),
               SizedBox(width:20),
               Container(
                   width: 40,
                   child: Image.asset("assets/icon/wchat.png",fit: BoxFit.cover,),
                 ),
             ],
           ),
            SizedBox(height: 20,),
            //用户协议
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  width: 10,
                  height: 10,
                  color: Colors.blue,
                ),

                Text("同意",style: TextStyle(
                  color:Colors.white54,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  ),),
                Container(
                  child: GestureDetector(
                    child: Text("《用户协议》",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    
                  )),
                  onTap: (){
                    
                  },
                  )
                ),
                Text("和",style: TextStyle(
                color:Colors.white54,
                fontSize: 14,
                decoration: TextDecoration.none,
                )),
                Container(
                  child: GestureDetector(
                    child: Text("《隐私政策》",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    
                  )),
                  onTap: (){
                    
                  },
                  )
                ),


              ],
            )

           ],
        )
    );
  }
}







