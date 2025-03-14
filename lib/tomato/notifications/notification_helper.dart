import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter/services.dart';

class NotificationHelper {
  static const platform = MethodChannel('com.example.app/notification');

  // 使用单例模式进行初始化
  static final NotificationHelper _instance = NotificationHelper._internal();
  factory NotificationHelper() => _instance;
  NotificationHelper._internal();

  // FlutterLocalNotificationsPlugin是一个用于处理本地通知的插件，它提供了在Flutter应用程序中发送和接收本地通知的功能。
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // 初始化函数
  Future initialize() async {
    // AndroidInitializationSettings是一个用于设置Android上的本地通知初始化的类
    // 使用了app_icon作为参数，这意味着在Android上，应用程序的图标将被用作本地通知的图标。
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    // 15.1是DarwinInitializationSettings，旧版本好像是IOSInitializationSettings（有些例子中就是这个）
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();
    // 初始化
    const InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    await _notificationsPlugin.initialize(initializationSettings);
  }

  Future<bool> isNotificationsEnabled() async {
    try {
      final bool isEnabled =
          await platform.invokeMethod('isNotificationsEnabled');
      return isEnabled;
    } on PlatformException catch (e) {
      print("Failed to check notification status: '${e.message}'.");
      return false;
    }
  }

  Future<void> openNotificationSettings() async {
    try {
      await platform.invokeMethod('openNotificationSettings');
    } on PlatformException catch (e) {
      print("Failed to open notification settings: '${e.message}'.");
    }
  }

//  显示通知
  Future showNotification(
      {required String title, required String body}) async {
    // 安卓的通知
    // 'your channel id'：用于指定通知通道的ID。
    // 'your channel name'：用于指定通知通道的名称。
    // 'your channel description'：用于指定通知通道的描述。
    // Importance.max：用于指定通知的重要性，设置为最高级别。
    // Priority.high：用于指定通知的优先级，设置为高优先级。
    // 'ticker'：用于指定通知的提示文本，即通知出现在通知中心的文本内容。
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your.channel.id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    // ios的通知
    const String darwinNotificationCategoryPlain = 'plainCategory';
    const DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails(
      categoryIdentifier: darwinNotificationCategoryPlain, // 通知分类
    );
    // 创建跨平台通知
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidNotificationDetails,iOS: iosNotificationDetails);

    // 发起一个通知
    await _notificationsPlugin.show(
      1,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  // 周期性通知
  Future scheduleNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your.channel.id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    // ios的通知
    const String darwinNotificationCategoryPlain = 'plainCategory';
    const DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails(
      categoryIdentifier: darwinNotificationCategoryPlain, // 通知分类
    );
    // 创建跨平台通知
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
// 发起通知
    await _notificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.everyMinute, platformChannelSpecifics);
  }

// 定时通知
  Future zonedScheduleNotification(
      {required int id,
        required String title,
        required String body,
        required DateTime scheduledDateTime}) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your.channel.id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');

    // ios的通知
    const String darwinNotificationCategoryPlain = 'plainCategory';
    const DarwinNotificationDetails iosNotificationDetails =
    DarwinNotificationDetails(
      categoryIdentifier: darwinNotificationCategoryPlain, // 通知分类
    );
    // 创建跨平台通知
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
    // 发起通知
    await _notificationsPlugin.zonedSchedule(
      id, title, body,
      tz.TZDateTime.from(scheduledDateTime, tz.local), // 使用本地时区的时间
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime, // 设置通知的触发时间是觉得时间
    );
  }


  //长文本
  // final androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //   'channel_id',
  //   'channel_name',
  //   'channel_description',
  //   styleInformation: BigTextStyleInformation('大文本内容'),
  // );


//大图片
//   final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'channel_id',
//     'channel_name',
//     'channel_description',
//     styleInformation: BigPictureStyleInformation(
//       FilePathAndroidBitmap('图片路径'),
//       largeIcon: FilePathAndroidBitmap('大图标路径'),
//     ),
//   );

}