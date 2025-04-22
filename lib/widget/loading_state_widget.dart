import 'package:flutter/material.dart';

enum ViewState{ loading, loaded, error}

class LoadingStateWidget extends StatelessWidget {
  final ViewState viewState;
  final Widget child;
  final VoidCallback ? onReload;

  const LoadingStateWidget({
    super.key,
    required this.viewState,
    required this.child,
    this.onReload,
  });



  @override
  Widget build(BuildContext context) {
    switch (viewState) {
      case ViewState.loading:
        return _loadView;
      case ViewState.loaded:
        return child;
     case ViewState.error:
       return _errorView;
    }
  }


  Widget get _loadView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get _errorView {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('加载失败，点击重试'),
          ElevatedButton(
            onPressed: () {
              onReload;
            },
            child: Text('重试'),
          )
        ],
      ),
    );
  }
}