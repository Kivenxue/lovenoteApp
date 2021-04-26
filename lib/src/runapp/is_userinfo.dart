import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import '';

// 注册  登录
// 
// 
// 用户协议  隐私政策
// 
class IsUserInfo extends StatefulWidget {
  @override
  _IsUserInfoState createState() => _IsUserInfoState();
}

class _IsUserInfoState extends State<IsUserInfo> {
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
                  Navigator.pushNamed(context, '/register');
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