import 'package:flutter/material.dart';
import 'package:lovenote/src/pages/user/Login.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

class SettingPageWidget extends StatefulWidget {
  @override
  _SettingPageWidgetState createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left:105),
          child: Text("设置",style: TextStyle(
            color: Colors.black
          ),),
        ),
        leading:InkWell(
          child:Container(
            margin: EdgeInsets.only(left:20),
            child: Icon(Icons.arrow_back_ios,color: Colors.black87,)
          ),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color.fromARGB(240, 247, 247, 247),
        child:_settingListWidget()
      ),
    );
  }



  _settingListWidget(){
    return Container(
      padding: EdgeInsets.fromLTRB(5, 8, 5,0),
      child: Column(
      children: [
        Card(
          child: ListTile(
          leading: Text("账号与安全"),
          trailing: Container(
            margin: EdgeInsets.only(right:5),
            child:Icon(
              Icons.admin_panel_settings_outlined,
              color: Colors.blueAccent,
              ),
            )
          ),
        ),
       

      Card(
        child: ListTile(
        leading: Text("消息通知"),
        trailing: Icon(Icons.chevron_right),
        ),
      ),
       

      Card(
        child: ListTile(
        leading: Text("关于我们"),
        trailing: Icon(Icons.chevron_right),
        ),
      ),
       

      Card(
        child: ListTile(
        leading: Text("清除本地缓存"),
        trailing: Icon(Icons.chevron_right),
        ),
      ),
       
    SizedBox(height: 50),
    Container(
      margin: EdgeInsets.fromLTRB(30, 5,30, 10),
      width: double.infinity,
      color: Colors.black26,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black54)
        ),
        onPressed: (){
        Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new LoginPageWidget()
          ), (route) => route == null);
        },
        child: Text("退出登录"),
      ),
    )
      
      
        

      ],
    ),
    );
  }
}