import 'package:flutter/material.dart';
import 'package:flutter_sample/container/share_data_widget.dart';

class InheritedWidgetTestRouter extends StatefulWidget {
  const InheritedWidgetTestRouter({super.key});

  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetTestRouterState();
  }
}

class _InheritedWidgetTestRouterState extends State<InheritedWidgetTestRouter>{
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child:
                  TestWidget(),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Text("Increment"))
            ],
          )),
    );
  }
}