import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // 数据列表
    final List<String> items = ["Item 1", "Item 2", "Item 3"];

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildListTitle(context, items[index]);
            }
        ),
    );
  }

  Widget _buildListTitle(BuildContext context, String title) {
    return InkWell(
      onTap: () => _handleTap(context, title),
      child: ListTile(title: Text(title)),
    );
  }

  void _handleTap(BuildContext context, String title) {
    Navigator.pushNamed(context, "new_page", arguments: "Hello");
  }
}
