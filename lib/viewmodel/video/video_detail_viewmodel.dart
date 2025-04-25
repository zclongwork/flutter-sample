import 'package:flutter_sample/http/Url.dart';
import 'package:flutter_sample/http/http_manager.dart';
import 'package:flutter_sample/model/AutoEntity.dart';
import 'package:flutter_sample/utils/toast_util.dart';
import 'package:flutter_sample/viewmodel/base_change_notifier.dart';
import 'package:flutter_sample/widget/loading_state_widget.dart';

class VideoDetailViewModel extends BaseChangeNotifier {
  List<Item> itemList = [];
  int? _videoId;

  void loadVideoData(int id) {
    _videoId = id;
    // https://baobab.kaiyanapp.com/api/v4/video/related?id=266986
    HttpManager().requestData('${Url.videoRelatedUrl}$id').then((res) {
      Issue issue = Issue.fromJson(res);
      itemList = issue.itemList!;
      viewState = ViewState.loaded;
    }).catchError((e) {
      ToastUtil.showError(e.toString());
      viewState = ViewState.error;
    }).whenComplete(() => notifyListeners());
  }

  void retry() {
    if (_videoId == null) {
      return;
    }
    viewState = ViewState.loading;
    notifyListeners();
    loadVideoData(_videoId!);
  }
}
