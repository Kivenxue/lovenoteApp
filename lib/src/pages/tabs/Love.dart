import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import 'package:lovenote/src/pages/love/love_daily.dart';
import 'package:lovenote/src/pages/love/love_pair.dart';




class LovePageWidget extends StatefulWidget {
  LovePageWidget({Key key}) : super(key: key);
  @override
  _LovePageWidgetState createState() => _LovePageWidgetState();
}

class _LovePageWidgetState extends State<LovePageWidget> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; 
  
  bool flg = true; 
  
  @override
  void dispose(){
    super.dispose();
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:flg?AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "恋爱日常",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500
            )),
          ],
        )
      ):AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "恋爱配对",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500
            )),
          ],
        )
      ),
      body:flg?LoveDailyPageWidget():LovePairPageWidget(),
    );
    
    
  }
}