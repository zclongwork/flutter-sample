import 'package:flutter/material.dart';

class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({super.key});

  @override
  _ScrollControllerTestRouteState createState() =>
      _ScrollControllerTestRouteState();
}

class _ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      print(_controller.offset);//打印滚动位置
      if(_controller.offset < 1000 && showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if(_controller.offset >= 1000 && showToTopBtn == false){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
      ),
      body: Scrollbar(
          child: ListView.builder(
              itemCount: 100,
              itemExtent: 50, //固定高度，性能消耗小
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              })),
      floatingActionButton: !showToTopBtn? null: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(
                    0,
                    duration: Duration(microseconds: 200),
                    curve: Curves.ease
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
