import 'package:flutter/material.dart';
import 'package:flutter_sample/state/state_lifecycle.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

const String STATE_LIFECYCLE = "State 生命周期";

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 数据列表
    final List<String> items = [STATE_LIFECYCLE, "布局组件", "Item 3"];

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
    if (title == STATE_LIFECYCLE) {
      //未定义路由的跳转
      Navigator.push(context, MaterialPageRoute(builder: (context) => StateLifeCycle()));
    } else {
      Navigator.pushNamed(context, "new_page", arguments: "Hello");
    }
  }
}
