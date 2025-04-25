import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/page/tab_navigation.dart';
import 'package:flutter_sample/page/video/video_detail_page.dart';
import 'package:flutter_sample/practice/home_page.dart';

class RouterConfigs {

  static const String practice = '/practice/HomePage';

  static const String home = '/TabNavigation';
  static const String detail = '/video/VideoDetailPage';

      static Map<String, WidgetBuilder> routes = {
        RouterConfigs.practice: (context) => HomePage(),

        RouterConfigs.home: (context) => TabNavigation(),
        RouterConfigs.detail: (context) => VideoDetailPage(),
      };
}