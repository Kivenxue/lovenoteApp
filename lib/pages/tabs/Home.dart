import 'package:flutter/material.dart';
import 'package:lovenote/services/ScreenAdaper.dart';
import '../home/mine.dart';
import '../home/moving.dart';

class HomePage extends StatefulWidget {
    HomePage({Key key}): super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  bool flg = false; 
  TabController _tabController;



  List<Widget> _pageList=[
    MinePage(),
    MovingPage()
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
              Tab(child: Text("我的")),
              Tab(child: Text("我们的动态",))
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


