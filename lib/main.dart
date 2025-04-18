import 'package:flutter/material.dart';
import 'package:flutter_sample/app_init.dart';
import 'package:flutter_sample/practice/router/new_router.dart';
import 'package:flutter_sample/tab_navigation.dart';
import 'package:flutter_sample/tomato/notifications/notification_helper.dart';

import 'practice/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DatabaseHelper.instance.database;
  // 初始化通知帮助类
  NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(future: AppInit.init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 加载中
          return CircularProgressIndicator();
        } else {
          return GetMaterialAppWidget(child: TabNavigation());
          // return GetMaterialAppWidget(child: HomePage(title: 'Home'));
        }
      },


      );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Home'),
      routes: {
        "new_page":(context) {
          final args = ModalRoute.of(context)?.settings.arguments as String?;
          return NewRoute(text: args.toString());
        },
      },
    );
  }
}

class GetMaterialAppWidget extends StatefulWidget {
  final Widget child;

  GetMaterialAppWidget({ Key? key, required this.child}) : super(key: key);

  @override
  _GetMaterialAppWidgetState createState() => _GetMaterialAppWidgetState();
}

class _GetMaterialAppWidgetState extends State<GetMaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EyePetizer',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => widget.child,
      },
    );
  }
}