import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timer_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await DatabaseHelper.instance.database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: MaterialApp(
        title: '番茄钟',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const TimerPage(),
      ),
    );
  }
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    super.initState();
    // 初始化通知
    Provider.of<TimerProvider>(context, listen: false).initializeNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('番茄钟'),
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
              child: const Text('开始', style: TextStyle(fontSize: 18)),
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
}