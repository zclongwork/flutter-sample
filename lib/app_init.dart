import 'package:flutter_splash_screen/flutter_splash_screen.dart';


class AppInit {
  AppInit._();

  static Future<void> init() async {
    // await CacheManager.preInit();
    // Url.baseUrl = 'http://baobab.kaiyanapp.com/api/';
    Future.delayed(Duration(milliseconds: 1000), () {
      FlutterSplashScreen.hide();
    });
  }
}
