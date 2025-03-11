import 'package:flutter/material.dart';
import 'package:flutter_sample/layout/layout_constraint_page.dart';
import 'package:flutter_sample/provider/async_build.dart';
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

const String STATE_LIFECYCLE = "State 生命周期";
const String ITEM_LAYOUT = "布局约束";
const String ITEM_CONTAINER = "容器类组件";
const String ITEM_Provider = "跨组件状态管理Provider";
const String ITEM_THEME = "颜色主题";
const String ITEM_ASYNC = "异步更新UI";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 数据列表
    final List<String> items = [
      STATE_LIFECYCLE,
      ITEM_LAYOUT,
      ITEM_CONTAINER,
      ITEM_Provider,
      ITEM_THEME,
      ITEM_ASYNC,
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
      case STATE_LIFECYCLE:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StateLifeCycle()));
        break;
      case ITEM_LAYOUT:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LayoutConstraintPage()));
        break;
      case ITEM_CONTAINER:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContainerPage()));
        break;
      case ITEM_Provider:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProviderRoute()));
        break;
      case ITEM_THEME:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThemeTestRoute()));
        break;
      case ITEM_ASYNC:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AsyncBuild()));
        break;
      default:
        Navigator.pushNamed(context, "new_page", arguments: "Hello");
        break;
    }
  }
}
