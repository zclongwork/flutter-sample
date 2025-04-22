import 'package:flutter/material.dart';

import '../widget/loading_state_widget.dart';

class BaseChangeNotifier with ChangeNotifier {
  ViewState viewState = ViewState.loading;

  bool _dispose = false;

  @override
  void dispose() {
    super.dispose();
    _dispose = true;
  }

  // 报错：_debugAssertNotDisposed() --》
  // https://github.com/rrousselGit/provider/issues/78
  @override
  void notifyListeners() {
    if (!_dispose) {
      super.notifyListeners();
    }
  }

}