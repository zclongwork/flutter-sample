import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home/home_page.dart';
import 'package:flutter_sample/utils/toast_util.dart';
import 'package:flutter_sample/viewmodel/tab_navigation_viewmodel.dart';
import 'package:flutter_sample/widget/provider_widget.dart';

import 'package:flutter_sample/practice/home_page.dart' as prcHome;

import '../config/string.dart';

class TabNavigation extends StatefulWidget {
  const TabNavigation({super.key});

  @override
  State<TabNavigation> createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  DateTime lastTime = DateTime.now();

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // 防止用户误碰
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(title: "首页"),
            Container(color: Colors.brown),
            Container(color: Colors.amber),
            prcHome.HomePage(),
          ],
        ),
        bottomNavigationBar: ProviderWidget(
            model: TabNavigationViewModel(),
            builder: (context, model, child) {
              return BottomNavigationBar(
                currentIndex: model.currentIndex,
                // 固定title
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color(0xff000000),
                unselectedItemColor: Color(0xff9a9a9a),
                items: _item(),
                // index 值为0，1，2，3
                onTap: (index) {
                  if (model.currentIndex != index) {
                    // 直接跳转不带动画，自动 setState
                    _pageController.jumpToPage(index);
                    model.changeBottomTabIndex(index);
                  }
                },
              );
            }),
      ),
    );
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
      ToastUtil.showTip(LeoString.exit_tip);
      return false;
    } else {
      // 自动出栈
      return true;
    }
  }
}
