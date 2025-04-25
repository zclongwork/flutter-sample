import 'package:flutter/material.dart';
import 'package:flutter_sample/app_init.dart';
import 'package:flutter_sample/config/route_configs.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
// 异步UI更新
    return FutureBuilder(
      future: AppInit.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 加载中
          return CircularProgressIndicator();
        } else {
          return GetMaterialAppWidget(path: RouterConfigs.home);
          // return GetMaterialAppWidget(child: HomePage(title: 'Home'));
        }
      },
      );
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  // final Widget child;
  final String path;

  const GetMaterialAppWidget({ super.key, required this.path});

  @override
  State<GetMaterialAppWidget> createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HomePage',
      initialRoute: widget.path,
      routes: RouterConfigs.routes,
    );
  }
}