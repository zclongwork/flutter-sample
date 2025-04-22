import 'dart:convert';
import 'package:flutter_sample/http/http_manager.dart';
import 'package:flutter_sample/model/AutoEntity.dart';
import 'package:flutter_sample/viewmodel/base_change_notifier.dart';
import 'package:logger/logger.dart';

import '../../http/Url.dart';
import '../../utils/toast_util.dart';
import '../../widget/loading_state_widget.dart';

var logger = Logger(printer: PrettyPrinter());

class HomePageViewModel extends BaseChangeNotifier {
  List<Item> bannerList = [];

  void refresh() {
    HttpManager.getData(
        Url.feedUrl,
        headers: Url.httpHeader,
        success: (result) {
          // logger.i(result);
          Map<String, dynamic> map = jsonDecode(result);
          List<dynamic> data = map["issueList"];
          Map<String, dynamic>  outer = data[0];

          List<dynamic> banners = outer["itemList"];
          if (banners.isNotEmpty) {
            // banners.map((item) => Item.fromJson(item)).toList();
            for (var element in banners) {
              bannerList.add(Item.fromJson(element));
            }
          }
          // 移除类型为 'banner2'
          bannerList.removeWhere((element) => element.type == 'banner2');

          logger.i("banner: ${bannerList.length}");
          viewState = ViewState.loaded;
        },
        fail: (e) {
          viewState = ViewState.error;
          logger.e(e);
          ToastUtil.showError(e.toString());
        },
        complete: () {
          notifyListeners();
        });
  }

  retry() {
    viewState = ViewState.loading;
    notifyListeners();
    refresh();
  }
}