import 'package:flutter/material.dart';
import 'package:flutter_sample/tomato/notifications/notification_helper.dart';

import 'home_page.dart';
import 'router/new_router.dart';

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