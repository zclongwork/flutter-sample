import 'package:flutter/material.dart';
import 'package:flutter_sample/layout/layout_constraint_page.dart';
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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 数据列表
    final List<String> items = [STATE_LIFECYCLE, ITEM_LAYOUT, ITEM_CONTAINER];

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
      default:
        Navigator.pushNamed(context, "new_page", arguments: "Hello");
        break;
    }
  }
}
