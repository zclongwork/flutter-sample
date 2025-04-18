import 'package:flutter/material.dart';

class GestureDrag extends StatefulWidget {
  const GestureDrag({super.key});

  @override
  State createState() => _GestureDragState();
}

class _GestureDragState extends State<GestureDrag>
    with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Gesture Drag"),
        ),
        body: Stack(children: <Widget>[
          Positioned(
              // left: _left,
              top: _top,
              child: GestureDetector(
                  child: CircleAvatar(
                    child: Text("A"),
                  ),
                  onPanDown: (details) {
                    print('onPanDown ${details.globalPosition}');
                  },
                  onPanStart: (details) {
                    print('onPanStart');
                  },
                  onPanUpdate: (details) {
                    print('onPanUpdate');
                    setState(() {
                      _top += details.delta.dy;
                      _left += details.delta.dx;
                    });
                  },
                  onPanEnd: (details) {
                    print('onPanEnd ${details.velocity}');
                  }))
        ]));
  }
}
