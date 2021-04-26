import 'package:flutter/material.dart';
import 'package:lovenote/src/services/ScreenAdaper.dart';
import 'package:lovenote/src/widget/SearchInput.dart';

class SetarchFriendListPage extends StatefulWidget {
  @override
  _SetarchFriendListPageState createState() => _SetarchFriendListPageState();
}

class _SetarchFriendListPageState extends State<SetarchFriendListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          child:Icon(Icons.arrow_back_ios,color: Colors.black,),
          onTap:(){
            Navigator.pop(context);
          },
        ),
        title:Container(
          margin: EdgeInsets.only(right:50),
          alignment: Alignment.center,
          child: Text("搜索好友",style: TextStyle(
          color: Colors.black
          ),)
        )
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchInputWidget(),
                  flex: 1,
                ),
                Text("搜索")
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: _searchFriendListData(),
            )
          ],
          ),
      )
    );
  }
}


Widget _searchFriendListData(){
  return Card(
    child: ListTile(
      leading:Container(
        width: 55,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset('assets/images/avatar2.jpg',fit: BoxFit.cover,),
        )
      ),
      title: Text("矢泽妮可"),
      subtitle: Text(
        "妮可妮可妮~",
        style: TextStyle(
        
        ),
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      trailing:  Container(
        margin: EdgeInsets.only(left:10),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black54)
          ),
          onPressed: (){
            // CheckCodeButtonFuntion();
          },
          child: Text("发消息"),
        ),
      ),

    ),
  );
}