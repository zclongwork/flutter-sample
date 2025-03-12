import 'package:flutter/material.dart';
import 'package:flutter_sample/container/inherited_widget_test_router.dart';

import 'infinite_list.dart';

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<ContainerPage> {

  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    InfiniteList(),
    // home(),
    // ScrollControllerTestRoute(),
    // ScrollControllerTestRoute()
    InheritedWidgetTestRouter()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/new_page');
              },
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.business),
            //   label: 'Business',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.school),
            //   label: 'School',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: 'Share',
            )
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                      title: const Text('Item 1'),
                      onTap: () {
                        // Update the state of the app.
                        //...
                      }
                  )
                ]
            )
        ),
        body: _widgetOptions.elementAt(_selectedIndex));
        // body: _home());
  }

  static Widget home() {
    return Align(
        alignment: Alignment.topCenter,
        child:
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          wContainer(BoxFit.none),
          Text('Wendux'),
          wContainer(BoxFit.contain),
          Text('Flutter中国'),
        ]));
  }

  static Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }
}
