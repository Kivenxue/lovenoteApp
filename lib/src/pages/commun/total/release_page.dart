import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:lovenote/src/utils/models.dart';
import 'package:lovenote/src/utils/utils.dart';
import 'package:nine_grid_view/nine_grid_view.dart';

class ReleasePageWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names

  @override
  _ReleasePageWidgetState createState() => _ReleasePageWidgetState();
}

class _ReleasePageWidgetState extends State<ReleasePageWidget> {
  List<ImageBean> imageList = List();
  int moveAction = MotionEvent.actionUp;
  bool _canDelete = false;

  @override
  void initState() {
    super.initState();
    _init();
  }
  
  void _init() {
    imageList = Utils.getTestData();
  }

  void _loadAssets(BuildContext context) {
    // pick Images.
    Utils.showSnackBar(context, "pick Images.");
  }

  //输入文本域控制器
  TextEditingController _userReleaseController = TextEditingController();
  FocusNode _userReleaseFocusNode = FocusNode();

  OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    gapPadding: 0,
    // borderSide: BorderSide(
    //   color:Colors.grey[100],
    // )
    borderSide: BorderSide.none
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left:100),
          child: Text("发布",style: TextStyle(color: Colors.black)),
        ),
        leading:InkWell(
          child:Container(
            margin: EdgeInsets.only(left:20),
            child: Icon(Icons.arrow_back_ios,color: Colors.black26,)
          ),
          onTap: (){Navigator.pop(context);},
        ),
      ),
      body: Stack(
        children: [
         Container(
           color: Colors.white,
           margin: EdgeInsets.only(top:2),
           child:  ListView(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.fromLTRB(10, 8, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.contain,),
                    ),
                  ),
                  
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints(
                  minHeight: 15.0,
                ),
               child: TextField(
                 controller: _userReleaseController,
                  focusNode: _userReleaseFocusNode,
                  style: TextStyle(fontSize: 16,color: Colors.black87),
                  // maxLength: 250,
                  // minLines: 1,
                  maxLines: 10,
                  autofocus: true,
                  cursorColor: Colors.black54,
                  cursorWidth: 1.5,                  
                  onChanged: (text){

                  },
                  decoration: InputDecoration(
                    hintText: "请输入...",
                    fillColor: Colors.white,
                    filled: true,
                    isCollapsed: true,
                    counterText:"",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    border: _outlineInputBorder,
                    focusedBorder: _outlineInputBorder,
                    enabledBorder: _outlineInputBorder,
                    disabledBorder: _outlineInputBorder,
                    focusedErrorBorder: _outlineInputBorder,
                    errorBorder: _outlineInputBorder,                  
                  ),
                ),
              ),
              DragSortView(
                imageList,
                space: 5,
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                padding: EdgeInsets.all(0),
                itemBuilder: (BuildContext context, int index) {
                  ImageBean bean = imageList[index];
                  // It is recommended to use a thumbnail picture
                  return Utils.getWidget(bean.thumbPath);
                },
                initBuilder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      _loadAssets(context);
                    },
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Icon(
                          Icons.add_a_photo_outlined,
                        ),
                      ),
                    ),
                  );
                },
                onDragListener: (MotionEvent event, double itemWidth) {
                  switch (event.action) {
                    case MotionEvent.actionDown:
                      moveAction = event.action;
                      setState(() {});
                      break;
                    case MotionEvent.actionMove:
                      double x = event.globalX + itemWidth;
                      double y = event.globalY + itemWidth;
                      double maxX = MediaQuery.of(context).size.width - 1 * 100;
                      double maxY = MediaQuery.of(context).size.height - 1 * 100;
                      print('maxX: $maxX, maxY: $maxY, x: $x, y: $y');
                      if (_canDelete && (x < maxX || y < maxY)) {
                        setState(() {
                          _canDelete = false;
                        });
                      } else if (!_canDelete && x > maxX && y > maxY) {
                        setState(() {
                          _canDelete = true;
                        });
                      }
                      break;
                      break;
                    case MotionEvent.actionUp:
                      moveAction = event.action;
                      if (_canDelete) {
                        setState(() {
                          _canDelete = false;
                        });
                        return true;
                      } else {
                        setState(() {});
                      }
                      break;
                  }
                  return false;
                },
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 3, 8, 5),
                      decoration: BoxDecoration(
                        color:Colors.pink[100],
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.loyalty_rounded,
                            color: Colors.pink,
                            size: 15,
                          ),
                          Text("添加标签",style: TextStyle(color: Colors.pink),)
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 3, 8, 5),
                      decoration: BoxDecoration(
                        color:Colors.blue[100],
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.place,
                            color: Colors.blueAccent,
                            size: 15,
                          ),
                          Text("添加地点",style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
         ),
        // Positioned(
        //   child: 
        // ),

        ],
      ),floatingActionButton: moveAction == MotionEvent.actionUp
      ? null
      : FloatingActionButton(
          onPressed: () {},
          child: Icon(_canDelete ? Icons.delete : Icons.delete_outline),
        ),
    );

  }
  








}