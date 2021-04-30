import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lovenote/src/widget/SearchInput.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //轮播图伪数据
  List<Map> imgList = [
    {
      "url":"https://gitee.com/master0037/publicImg/raw/master/longImg4.jpg",
    },
    {
      "url":"https://gitee.com/master0037/publicImg/raw/master/longImg5.jpg",
    },
    {
      "url":"https://gitee.com/master0037/publicImg/raw/master/longImg6.jpg",
    },
    {
      "url":"https://gitee.com/master0037/publicImg/raw/master/longImg3.jpg",
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            "HomePage",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500
            )),
          ],
        )
      ),
      body:SingleChildScrollView(
          child: Column(
          children:[
            Container(
                margin: EdgeInsets.only(top:20),
                width: double.infinity,  
                child: AspectRatio(
                  aspectRatio: 16/9,  //宽高比例  适配所有屏幕
                  child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child:Image.network(
                            imgList[index]["url"],
                            fit: BoxFit.fill,
                          )
                        );
                      },
                      itemCount: 3, //循环遍历三次
                      //autoplay:true,  //设置自动轮播
                      duration: 800,
                      // autoplay:true,
                      viewportFraction: 0.8,
                      scale: 0.9,
                    ),
                  ) //等比例铺满
                ),
          
            _loveSearchCard(),


            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.only(left:20),
                  child: Text("推介文章",style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),),
                )
              ],
            ),
            //需要替换 动态 网格布局
          
            _getAticleData(),
            _getAticleData(),
            _getAticleData(),
            _getAticleData(),
          ],
        ),
      )
        
      
         
      );
  }

}


Widget _loveSearchCard(){
 return Card(
        margin: EdgeInsets.only(top:20,left:20,right:20),
        child:Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child:Padding(
                      padding: EdgeInsets.only(left:10,bottom: 5),
                      child: Text("恋爱查询",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.pinkAccent
                      ),
                    ),
                    ),
                    flex: 1, 
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(child:  SearchInputWidget(text: "请输入手机号",maxLines: 1,maxCunt: 11,))
                ],  
              ),
            ],
          ),
        )
      ),
    );
}


Widget _getAticleData(){
  return Container(
    width: 360,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child:Container(
              padding: EdgeInsets.all(5),
              child:Column(
              children: [
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        child: Image.asset("assets/images/message2.jpg",fit: BoxFit.cover,),
                      )
                    ],
                  ),
                  Text("文章标题....")
                ],
              ),
            )
          ),
          
          Card(
            margin: EdgeInsets.all(5),
            child:Container(
              padding: EdgeInsets.all(5),
              child:Column(
              children: [
                  Stack(
                    children: [
                      Container(
                        width: 150,
                        child: Image.asset("assets/images/message2.jpg",fit: BoxFit.cover,),
                      )
                    ],
                  ),
                  Text("文章标题....")
                ],
              ),
            )
          ),         
        ],
      )
  );
}


Container buildBackground() {
    return Container(
      decoration: BoxDecoration(
        //线性渐变
        gradient: LinearGradient(
          //渐变角度
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //渐变颜色组
          colors: [
            Colors.pinkAccent.withOpacity(0.3),
            Colors.pink.withOpacity(0.3),
            Colors.blue.withOpacity(0.3),
          ],
        ),
      ),
    );
  }

