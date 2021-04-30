import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class RegisterPageWidget extends StatefulWidget {
  @override
  _RegisterPageWidgetState createState() => _RegisterPageWidgetState();
}

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  FocusNode _userPhoneFocusNode = new FocusNode();
  FocusNode _userCheckCodeFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        hindInputFouce();
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
      children: [
        //Logo
        buildUserPhoneWidget(),
        SizedBox(height:10),
        buildCheckCodeWidget(),
        SizedBox(height:10),
        buildCheckCodeButton(),

        Container(
          margin: EdgeInsets.fromLTRB(28, 5,28, 10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
              Text(
                "收不到验证码?",
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


StreamController<String> _userPhoneStreamController = new StreamController();
StreamController<String> _userCheckCodeStreamController = new StreamController();

//获取用户输入
TextEditingController _userPhoneTextController = TextEditingController();
TextEditingController _userCheckCodeController = TextEditingController();
//抖动控制器
ShakeAnimationController _userPhoneShakeController = ShakeAnimationController();
ShakeAnimationController _userCheckCodeShakeController = ShakeAnimationController();

 OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

Widget buildCheckCodeWidget(){
  return Padding(
    padding: EdgeInsets.fromLTRB(28, 5, 28, 5),
    child: Row(
    children: [
       Expanded(
        child: TextField(
          keyboardType: TextInputType.number,
          controller: _userCheckCodeController,
          focusNode: _userCheckCodeFocusNode,
          maxLength: 6,
          minLines: 1,
          style: TextStyle(fontSize: 16,color: Colors.black87),
          // maxLength: null,
          onChanged: (text){
          },
          decoration: InputDecoration(
            fillColor: Colors.grey[50],
            filled: true,
            isCollapsed: true,
            counterText:"",
            hintText: "请输入验证码",
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            border: _outlineInputBorder,
            focusedBorder: _outlineInputBorder,
            enabledBorder: _outlineInputBorder,
            disabledBorder: _outlineInputBorder,
            focusedErrorBorder: _outlineInputBorder,
            errorBorder: _outlineInputBorder,
          )
        ),
        flex: 1,
      ),
      SizedBox(width: 10),
      ElevatedButton(
        style: ButtonStyle(
         backgroundColor: MaterialStateProperty.all(Colors.black54)        
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Text("验证码(5)"),
        ),
        onPressed: (){

        },       
      )
    ],
   ),

  );
}


bool checkCodePhone(){
  String checkCode = _userCheckCodeController.text;
  if(checkCode.length == 0){
    _userCheckCodeStreamController.add("请输入手机号");
    //输入抖动
    _userCheckCodeShakeController.start();
    return false;
  }else{
    _userCheckCodeStreamController.add(null);
    return true;
  }
}







//手机号验证注册
Widget buildUserPhoneWidget(){
  //手机号验证注册
  return Container(
    margin: EdgeInsets.fromLTRB(28, 10,28, 10),
    child:  StreamBuilder<String>(
    stream: _userPhoneStreamController.stream,
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      return ShakeAnimationWidget(
        shakeAnimationType: ShakeAnimationType.LeftRightShake,
        isForward: false,
        shakeCount: 0,
        shakeRange: 0.2,
        shakeAnimationController: _userPhoneShakeController,
        child:TextField(
        
        controller: _userPhoneTextController,
        focusNode: _userPhoneFocusNode,
        decoration: InputDecoration(
          focusColor: Colors.grey,
          focusedBorder: _outlineInputBorder,
          errorText: snapshot.data,
          labelText: "+86",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),

        onSubmitted: (String value){
          if(checkUserPhone()){
            _userCheckCodeFocusNode.unfocus();
          }else{
            FocusScope.of(context).requestFocus(_userPhoneFocusNode);
          }
        },
      )
      
       
      );

    },)
  );
}

  bool checkUserPhone(){
    String phone = _userPhoneTextController.text;
    if(phone.length == 0){
      _userPhoneStreamController.add("请输入用户名");
      //输入抖动
      _userPhoneShakeController.start();
      return false;
    }else{
      _userPhoneStreamController.add(null);
      return true;
    }
  }
  //隐藏输入
  void hindInputFouce(){
    SystemChannels.textInput.invokeMapMethod('TextInput.hide');
    _userPhoneFocusNode.unfocus();
    _userCheckCodeFocusNode.unfocus();
  }
  

  Widget buildCheckCodeButton(){
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
        child: Text("下一步"),
      ),
    );
  }
}

