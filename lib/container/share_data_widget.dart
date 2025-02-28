import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {

  const ShareDataWidget({
    super.key,
    required this.data,
    required super.child,
  });


  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    //dependOnInheritedWidgetOfExactType会建立依赖关系，ShareDataWidget发生变化时，会调用子widget的didChangeDependencies()方法
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();

    // return context.getElementForInheritedWidgetOfExactType()!.widget as ShareDataWidget?;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<TestWidget>{

  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print('dependencies change');
  }
}