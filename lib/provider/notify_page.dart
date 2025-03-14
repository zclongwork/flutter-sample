import 'package:flutter/material.dart';

import '../tomato/notifications/notification_helper.dart';

class NotifyPage extends StatefulWidget {
  const NotifyPage({super.key});

  @override
  State createState() {
    return _NotifyPageState();
  }

}

class _NotifyPageState extends State<NotifyPage>{

  @override
  Widget build(BuildContext context) {

    final NotificationHelper notificationHelper = NotificationHelper();
    return Scaffold(
      appBar: AppBar(
        title: Text("通知栏通知"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              checkAndOpenNotificationSettings();
            },
            child: const Text("权限检查", style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: () {
              notificationHelper.showNotification(
                title: 'Hello',
                body: 'This is a notification!',
              );
            },
            child: const Text("通知", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );

  }

  Future<void> checkAndOpenNotificationSettings() async {
    final helper = NotificationHelper();
    final isEnabled = await helper.isNotificationsEnabled();
    if (!isEnabled) {
      _showDialog(context);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)), // 设置圆角大小
            ),
                contentPadding: EdgeInsets.zero,
                title: Text("通知权限未开启"),
                content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("请开启通知权限以接收重要消息。"),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("取消"),
                  ),
                  TextButton(
                    onPressed: () {
                      // helper.openNotificationSettings();
                      Navigator.pop(context);
                    },
                    child: Text("去设置"),
                  ),
                ]));
  }
}


