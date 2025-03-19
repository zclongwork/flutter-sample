import 'package:flutter/material.dart';
import 'package:flutter_sample/gesture/gesture_route.dart';
import 'package:flutter_sample/layout/layout_constraint_page.dart';
import 'package:flutter_sample/provider/async_build.dart';
import 'package:flutter_sample/provider/notify_page.dart';
import 'package:flutter_sample/provider/provider_route.dart';
import 'package:flutter_sample/provider/theme_test_route.dart';
import 'package:flutter_sample/state/state_lifecycle.dart';

import 'container/container_page.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

const String stateLifecycle = "State 生命周期";
const String itemLayout = "布局约束";
const String itemContainer = "容器类组件";
const String itemProvider = "跨组件状态管理Provider";
const String itemTheme = "颜色主题";
const String itemAsync = "异步更新UI";
const String itemNotify = "通知栏通知";
const String itemGesture = "手势";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 数据列表
    final List<String> items = [
      stateLifecycle,
      itemLayout,
      itemContainer,
      itemProvider,
      itemTheme,
      itemAsync,
      itemNotify,
      itemGesture,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildListTitle(context, items[index]);
          }),
    );
  }

  Widget _buildListTitle(BuildContext context, String title) {
    return InkWell(
      onTap: () => _handleTap(context, title),
      child: ListTile(title: Text(title)),
    );
  }

  void _handleTap(BuildContext context, String title) {
    switch (title) {
      case stateLifecycle:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StateLifeCycle()));
        break;
      case itemLayout:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LayoutConstraintPage()));
        break;
      case itemContainer:
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => ContainerPage()));
        break;
      case itemProvider:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProviderRoute()));
        break;
      case itemTheme:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThemeTestRoute()));
        break;
      case itemAsync:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AsyncBuild()));
        break;
      case itemNotify:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NotifyPage()));
        break;
      case itemGesture:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GestureRoute()));
        break;
      default:
        Navigator.pushNamed(context, "new_page", arguments: "Hello");
        break;
    }
  }
}
