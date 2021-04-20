import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaper {

  static height(double value) {
    return ScreenUtil().setHeight(value);
  }

  static width(double value) {
    return ScreenUtil().setWidth(value);
  }

  static getScreenHeight() {
    return ScreenUtil().screenHeight;
  }

   static getScreenWidth() {
    return ScreenUtil().screenWidth;
  }




  static size(double value){
    return ScreenUtil().setSp(value);
  }
}