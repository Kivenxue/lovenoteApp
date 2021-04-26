import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lovenote/src/runapp/root_app_page.dart';

void main() {  //禁止设备横屏
  WidgetsFlutterBinding.ensureInitialized(); //必须要添加这个进行初始化 否则下面会错误
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(RootAPP());
  });
}
