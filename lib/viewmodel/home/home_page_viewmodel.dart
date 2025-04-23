import 'package:flutter_sample/model/issue_entity.dart';
import 'package:flutter_sample/viewmodel/base_list_viewmodel.dart';
import 'package:logger/logger.dart';

import '../../http/Url.dart';
import '../../model/AutoEntity.dart';

var logger = Logger(printer: PrettyPrinter());

class HomePageViewModel extends BaseListViewModel<Item, IssueEntity> {
  List<Item> bannerList = [];
  @override
  IssueEntity getModel(Map<String, dynamic> json) {
    return IssueEntity.fromJson(json);
  }

  @override
  String getUrl() {
    return Url.feedUrl;
  }

  @override
  void getData(List<Item>? list) {
    if (list != null) {
      bannerList = list;
      itemList.clear();
      //为Banner占位，后面要接list列表
      itemList.add(Item());
    }
  }


  @override
  void removeUselessData(List<Item>? list) {
    // 移除类型为 'banner2' 的数据
    list?.removeWhere((item) {
      return item.type == 'banner2';
    });
  }

  @override
  void doExtraAfterRefresh() async {
    // 此处调用加载更多，是为了获取首次列表数据，因为第一个列表数据用来做banner数据了。
    await loadMore();
  }

}