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
  
  bool flg = false; 
  TabController _tabController;



  List<Widget> _pageList=[
    LoveDailyPageWidget(),
    LovePairPageWidget()
  ];

  
  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      print(_tabController.index);
    });
  } 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white54,
          title: TabBar(
            controller: this._tabController,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.black,
            // 选中样式
            labelStyle: TextStyle(
              fontSize:ScreenAdaper.size(35),
              fontWeight: FontWeight.bold,
              ),
            //未选中样式 
            unselectedLabelStyle: TextStyle(
              fontSize:ScreenAdaper.size(30),
            ),
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Tab(child: Text("恋爱日常")),
              Tab(child: Text("配对",))
            ]),
        ),
        body: InkWell(
          child: TabBarView(
          controller :this._tabController,
          children:this._pageList,
          ),
        )
      )
    );
    
  }
}