import 'package:flutter_sample/http/http_manager.dart';
import 'package:flutter_sample/model/page_model.dart';
import 'package:flutter_sample/utils/toast_util.dart';
import 'package:flutter_sample/viewmodel/base_change_notifier.dart';
import 'package:flutter_sample/widget/loading_state_widget.dart';

import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


abstract class BaseListViewModel<T, M extends PageModel<T>>
    extends BaseChangeNotifier {
  List<T> itemList = []; //集合数组

  String? nextPageUrl; //下一页请求链接

  //上拉加载/下拉刷新控制器
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  //请求数据地址
  String getUrl();

  //请求返回的真实数据模型
  M getModel(Map<String, dynamic> json);

  // 获取数据
  void getData(List<T> list) {
    this.itemList = list;
  }

  // 移除无用数据
  void removeUselessData(List<T>? list) {}

  //下拉刷新后的额外操作
  void doExtraAfterRefresh() {}

  //上拉加载更多请求地址
  String? getNextUrl(M model) {
    return model.nextPageUrl;
  }

  //下拉刷新
  void refresh() {
    HttpManager.getData(
      getUrl(),
      success: (json) {
        M model = getModel(json);
        removeUselessData(model.itemList);
        getData(model.itemList!);
        viewState = ViewState.loaded;

        // 下一页数据的处理
        nextPageUrl = getNextUrl(model);
        refreshController.refreshCompleted();
        //todo check
        // refreshController.footerMode.value = LoadStatus.canLoading;
        // 做额外的操作：例如加载home的列表数据
        doExtraAfterRefresh();
      },
      fail: (e) {
        ToastUtil.showError(e.toString());
        refreshController.refreshFailed();
        viewState = ViewState.error;
      },
      complete: () => notifyListeners(),
    );
  }

  //加载更多
  Future<void> loadMore() async {
    if (nextPageUrl == null) {
      refreshController.loadNoData();
      return;
    }
    HttpManager.getData(nextPageUrl!, success: (json) {
      M model = getModel(json);
      removeUselessData(model.itemList);
      // 将model.itemList数据，接到 itemList 数组后面
      itemList?.addAll(model.itemList!);
      nextPageUrl = getNextUrl(model);
      refreshController.loadComplete();
      notifyListeners();
    }, fail: (e) {
      ToastUtil.showError(e.toString());
      refreshController.loadFailed();
    });
  }

  //错误重试
  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}
