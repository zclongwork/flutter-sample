import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:provider/provider.dart';

import '../localizations/bo_intl.dart';
import 'history_page.dart';
import 'notifications/notification_helper.dart';
import 'timer_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: MaterialApp(
        onGenerateTitle: (context){
          return AppLocalizations.of(context).appName;
        },
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          BoMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'), // 英文
          const Locale('zh'), // 中文
          const Locale('bo'), // 藏语
        ],
        // locale: Locale('en'), // 手动指定语言（测试用）
        home: const TimerPage(),
      ),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TimerPageState();
  }
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    super.initState();
    hideScreen();
    // 初始化通知
    Provider.of<TimerProvider>(context, listen: false).initializeNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    final String title = AppLocalizations.of(context).appName;
    final NotificationHelper _notificationHelper = NotificationHelper();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                );
              },
              tooltip: '查看历史记录',
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
          timerProvider.isWorking ? '工作时间' : '休息时间',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
              '${timerProvider.getMinutes}:${timerProvider.getSeconds.padLeft(2, '0')}',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: timerProvider.isRunning
                  ? null
                  : () {
                if (timerProvider.isWorking) {
                  timerProvider.startWorkTimer();
                } else {
                  timerProvider.startBreakTimer();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(AppLocalizations.of(context).start, style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: timerProvider.isRunning
                  ? () {
                timerProvider.stopTimer();
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('停止', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: !timerProvider.isRunning
                  ? () {
                timerProvider.resetTimer();

                _notificationHelper.showNotification(
                  title: 'Hello',
                  body: 'This is a notification!',
                );
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('重置', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
        const SizedBox(height: 30),
        if (timerProvider.isBreakPending)
    Column(
      children: [
        const Text('工作时间结束！开始休息吗？', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                timerProvider.startBreakTimer();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('是', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                timerProvider.resetTimer();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('否', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ],
    ),
    ],
    ),
    ),
    );
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 1800), () {
      FlutterSplashScreen.hide();
    });
  }
}