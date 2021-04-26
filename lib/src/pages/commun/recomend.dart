

import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';

class RecomendPage extends StatefulWidget {
  @override
  _RecomendPageState createState() => _RecomendPageState();
}



Widget _RecomendUserWidget(BuildContext context){
  
  return Card(
    child:ListTile(
      leading: Container(
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset("assets/images/avatar2.jpg",fit:BoxFit.contain),
        ),
      ),
      title: Text("用户昵称"),
      subtitle: Text("这家伙很懒什么都没写~"),
      trailing:Container(
          width: ScreenAdaper.width(120),
          height: ScreenAdaper.height(50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.blueAccent, width: 1),
          ),
          child:InkWell(
            child: Text("关注",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueAccent
              ),
            ),
           onTap: (){
             
           },
          )
      ),
    ) 
  );
}

class _RecomendPageState extends State<RecomendPage> {
  bool islike=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color.fromARGB(240, 247, 247, 247),
      child:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left:10),
                child:Text("推介关注",textAlign: TextAlign.left,style: TextStyle(fontSize: 25)),
              ),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),

            _RecomendUserWidget(context),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),
            _RecomendUserWidget(context),

            _RecomendUserWidget(context),

            _RecomendUserWidget(context),
            _RecomendUserWidget(context)

            ],
          )
        ),
    );
    
    }
}