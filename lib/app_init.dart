import 'package:flutter/material.dart';
import 'package:flutter_sample/tomato/notifications/notification_helper.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';


class AppInit {
  AppInit._();

  static Future<void> init() async {

    WidgetsFlutterBinding.ensureInitialized();
    // await DatabaseHelper.instance.database;
    // 初始化通知帮助类
    NotificationHelper notificationHelper = NotificationHelper();
    await notificationHelper.initialize();

    // await CacheManager.preInit();
    // Url.baseUrl = 'http://baobab.kaiyanapp.com/api/';
    Future.delayed(Duration(milliseconds: 1000), () {
      FlutterSplashScreen.hide();
    });
  }
}
