import 'package:flutter/material.dart' hide Page;
import 'package:flutter_sample/gesture/gesture_drag.dart';

class GestureRoute extends StatelessWidget {
  const GestureRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text("拖拽"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GestureDrag()));
              },
            ),
            GestureDetector(
              onTap: () {
                print('outer click');
              },
              onTapDown: (details) {
                print('outer tap down');
              },
              onDoubleTap: () {
                print('outer double tap');
              },
              onLongPress: () {
                print('outer long press');
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTapDown: (details) {
                    print('inner tap down');
                  },
                  onTap: () {
                    print('inner click');
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
