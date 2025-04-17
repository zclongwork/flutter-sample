import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/toast_util.dart';

import 'config/string.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({super.key});

  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  DateTime lastTime = DateTime.now();
  Widget _currentBody = Container(
    color: Colors.blue,
  );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 防止用户误碰
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _currentBody,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff000000),
          unselectedItemColor: Color(0xff9a9a9a),
          items: _item(),
          onTap: _onTap,
        ),
      ),
    );
  }

  _onTap(int index) {
    switch (index) {
      case 0:
        _currentBody = Container(color: Colors.blue);
        break;
      case 1:
        _currentBody = Container(color: Colors.brown);
        break;
      case 2:
        _currentBody = Container(color: Colors.amber);
        break;
      case 3:
        _currentBody = Container(color: Colors.red);
        break;
    }
    setState(() {
      _currentIndex = index;
    });
  }

  List<BottomNavigationBarItem> _item() {
    return [
      _bottomItem(LeoString.home, 'assets/images/ic_home_normal.png',
          'assets/images/ic_home_selected.png'),
      _bottomItem(LeoString.discovery, 'assets/images/ic_discovery_normal.png',
          'assets/images/ic_discovery_selected.png'),
      _bottomItem(LeoString.hot, 'assets/images/ic_hot_normal.png',
          'assets/images/ic_hot_selected.png'),
      _bottomItem(LeoString.mine, 'assets/images/ic_mine_normal.png',
          'assets/images/ic_mine_selected.png'),
    ];
  }

  _bottomItem(String title, String normalIcon, String selectorIcon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        normalIcon,
        width: 24,
        height: 24,
      ),
      activeIcon: Image.asset(
        selectorIcon,
        width: 24,
        height: 24,
      ),
      label: title,
    );
  }

  Future<bool> _onWillPop() async {
    if (DateTime.now().difference(lastTime) > Duration(seconds: 2)) {
      lastTime = DateTime.now();
      LeoToast.showTip(LeoString.exit_tip);
      return false;
    } else {
      // 自动出栈
      return true;
    }
  }
}
