import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_sample/tomato/database/timer_record.dart';

import 'database/app_database.dart';


class TimerProvider with ChangeNotifier {
  final int _workDuration = 1 * 60; // 25分钟
  final int _breakDuration = 1 * 60; // 5分钟
  int _currentDuration = 1 * 60;
  bool _isRunning = false;
  bool _isWorking = true;
  bool _isBreakPending = false;
  late Timer _timer;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  int get getMinutes {
    final minutes = (_currentDuration ~/ 60).abs(); // 确保结果为非负整数
    return int.parse(minutes.toString().padLeft(2, '0')); // 格式化为两位数
  }

  String get getSeconds => (_currentDuration % 60).toString().padLeft(2, '0');

  bool get isRunning => _isRunning;

  bool get isWorking => _isWorking;

  bool get isBreakPending => _isBreakPending;

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    initializeDatabase();
  }

  void startWorkTimer() {
    _isWorking = true;
    _isBreakPending = false;
    _currentDuration = _workDuration;
    _startTimer();
    notifyListeners();
  }

  void startBreakTimer() {
    _isWorking = false;
    _isBreakPending = false;
    _currentDuration = _breakDuration;
    _startTimer();
    notifyListeners();
  }

  void _startTimer() {
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentDuration > 0) {
        _currentDuration--;
      } else {
        _timer.cancel();
        _isRunning = false;
        _handleTimerEnd();
      }
      notifyListeners();
    });
  }

  void _handleTimerEnd() {
    if (_isWorking) {
      _showNotification('工作时间结束', '休息一下吧！');
      _isBreakPending = true;
      _saveTimerRecord(DateTime.now(),
          DateTime.now().add(Duration(seconds: _currentDuration)), '工作');
    } else {
      _showNotification('休息时间结束', '继续工作吧！');
      _saveTimerRecord(DateTime.now(),
          DateTime.now().add(Duration(seconds: _currentDuration)), '休息');
    }
    notifyListeners();
  }

  void stopTimer() {
    _timer.cancel();
    _isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    _timer.cancel();
    _isRunning = false;
    _isBreakPending = false;
    _currentDuration = _isWorking ? _workDuration : _breakDuration;
    notifyListeners();
  }

  Future<void> _showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }


  late AppDatabase database;

  Future<void> initializeDatabase() async {
    final databaseIn =
        await $FloorAppDatabase.databaseBuilder('timers.db').build();
    database = databaseIn;
  }

  Future<void> _saveTimerRecord(
      DateTime startTime, DateTime endTime, String type) async {
    final timerRecord = TimerRecord(
        null, startTime.toIso8601String(), endTime.toIso8601String(), type);
    await database.timerDao.insertTimer(timerRecord);
  }
}
