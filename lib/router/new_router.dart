import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  final String text;

  const NewRoute({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child:Column(
          children: [
            Text("This is new route：$text"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "返回值哦");
              },
              child: Text("返回"),
            ),
          ],
        )
      ),
    );
  }
}
