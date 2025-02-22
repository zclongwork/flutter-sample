import 'package:flutter/material.dart';

class StateLifeCycle extends StatefulWidget {
  const StateLifeCycle({super.key});
  @override
  State<StateLifeCycle> createState() => _StateLifeCycleState();
}

class _StateLifeCycleState extends State<StateLifeCycle> {
  bool isShowChild = true;

  @override
  void initState() {
    debugPrint("initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StateLifeCycle oldWidget) {
    debugPrint("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    debugPrint("deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("StateLifeCycle"),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          setState(() {
            isShowChild = !isShowChild;
            debugPrint("on Pressed isShowChild:$isShowChild");
          });
        }, child: isShowChild? const Child() : Text("--Child 已经移除了")),
      ),
    );
  }
}

class Child extends StatefulWidget {
  const Child({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChildState();
  }
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    return Text("Child text");
  }

  @override
  void initState() {
    debugPrint("--Child initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    debugPrint("--Child didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant Child oldWidget) {
    debugPrint("--Child didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }


  @override
  void deactivate() {
    debugPrint("--Child deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    debugPrint("--Child dispose");
    super.dispose();
  }
}