import 'package:flutter/material.dart';
import '../../services/ScreenAdaper.dart';
//引入子页面
import '../commun/follow.dart';
import '../commun/fresh.dart';
import '../commun/recomend.dart';

class CommunPage extends StatefulWidget {
  CommunPage({Key key}): super(key: key);

  @override
  _CommunPageState createState() => _CommunPageState();
}

class _CommunPageState extends State<CommunPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  List<Widget> _pageList=[
    FollowPage(),
    FreshPage(),
    RecomendPage()
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
    _tabController = new TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      print(_tabController.index);
    });
  } 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            labelPadding: EdgeInsets.all(10),
            controller: this._tabController,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.pinkAccent,
            // 选中样式
            labelStyle: TextStyle(
              fontSize:ScreenAdaper.size(35),
              fontWeight: FontWeight.bold,
              ),
            //未选中样式 
            unselectedLabelStyle: TextStyle(
              fontSize:ScreenAdaper.size(28),
            ),
            indicatorColor: Colors.pinkAccent,
            tabs: <Widget>[
                Tab(child: Text("推介")),
                Tab(child: Text("新鲜")),
                Tab(child: Text("关注")),
              ]
          ),
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