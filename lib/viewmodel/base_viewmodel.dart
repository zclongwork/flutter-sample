//分页模型抽取
import 'package:flutter_sample/viewmodel/base_change_notifier.dart';
import 'package:flutter_sample/widget/loading_state_widget.dart';

abstract class BaseViewModel extends BaseChangeNotifier {

  // 获取数据
  void refresh(){}

  void loadMore(){}

  //错误重试
  void retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}