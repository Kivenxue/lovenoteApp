import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lovenote/src/routers/router.dart';


class RootAPP extends StatefulWidget {
  @override
  _RootAPPState createState() => _RootAPPState();
}

class _RootAPPState extends State<RootAPP> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        builder: ()=>MaterialApp(
            initialRoute: '/  ',
            onGenerateRoute: onGenerateRoute,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              highlightColor: Colors.transparent, 
              splashColor: Colors.transparent, 
            ),
        ),
    );
  }
}