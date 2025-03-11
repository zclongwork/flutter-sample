import 'package:flutter/material.dart';

class AsyncBuild extends StatefulWidget {
  const AsyncBuild({super.key});

  @override
  State createState() {
    return _AsyncBuildState();
  }

}

class _AsyncBuildState extends State<AsyncBuild>{
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => '我是从互联网上获取的数据');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: mockNetworkData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('error ${snapshot.error}');
            } else {
              return Text("content: ${snapshot.data}");
            }

          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}