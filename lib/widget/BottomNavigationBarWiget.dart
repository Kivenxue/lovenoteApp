// Container(
//   width: ScreenAdaper.width(700.0),
//   height: ScreenAdaper.height(150.0),
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       image: AssetImage("images/hbg.jpg"),
//       fit: BoxFit.cover
//     ),
//     //设置四周圆角 角度
//     borderRadius: BorderRadius.all(Radius.circular(4.0)),
//   ),
  
//   child: Column(
    
//     children: [
//       SizedBox(height: ScreenAdaper.height(150)),
//         Row(
//         //  crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Expanded(
              
//               child:Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       child:ClipRRect(
//                         borderRadius: BorderRadius.circular(40),
//                         child: Image.asset('images/avatar.jpg', width:  ScreenAdaper.width(100), fit:BoxFit.cover),
//                       )
                      
//                     )
//                   ],
//                 ),
//               ),
//               flex: 1,
//             ),
//             Expanded(
//               child:Container(
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("💕相恋",style: TextStyle(fontSize: 18,color: Colors.black),),
//                     Text("50 天",style: TextStyle(fontSize: 18,color: Colors.white),)
//                   ],
//                 ),
//               ),
//               flex: 1,
//             ),
//             Expanded(
//               child:Container(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       child:ClipRRect(
//                         borderRadius: BorderRadius.circular(40),
//                         child: Image.asset('images/avatar2.jpg', width:  ScreenAdaper.width(100), fit:BoxFit.cover),
//                       )
                      
//                     )
//                   ],
//                 ),
//               ),
//               flex: 1,
//             ),

//           ],
//         ),
//     ],
//   )

  
// ),
// 
// 
// 
// 
// 
// 
//   Row(
              //   children: <Widget>[
                
              //    Expanded(
              //      child:  Container(
              //       child: ClipRRect(
              //           borderRadius: BorderRadius.circular(40),
              //           child:Image.asset("images/avatar.jpg",
              //           fit: BoxFit.contain),
              //         )
              //       ),
              //     flex: 1
              //    ),
              //    Expanded(
              //      child:  Container(
              //       child: ClipRRect(
              //           borderRadius: BorderRadius.circular(40),
              //           child:Image.asset("images/avatar.jpg",
              //           fit: BoxFit.contain),
              //         )
              //       ),
              //     flex: 1
              //    ),
              //    Expanded(
              //      child:  Container(
              //       child: ClipRRect(
              //           borderRadius: BorderRadius.circular(40),
              //           child:Image.asset("images/avatar.jpg",
              //           width: ScreenAdaper.width(120),
              //           fit: BoxFit.contain),
              //         )
              //       ),
              //     flex: 1
              //    ),
                
              //   ],
                
              // )