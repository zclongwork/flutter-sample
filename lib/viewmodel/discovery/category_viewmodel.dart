import 'package:flutter_sample/http/Url.dart';
import 'package:flutter_sample/http/http_manager.dart';
import 'package:flutter_sample/model/category_model.dart';
import 'package:flutter_sample/utils/toast_util.dart';
import 'package:flutter_sample/viewmodel/base_viewmodel.dart';
import 'package:flutter_sample/widget/loading_state_widget.dart';

class CategoryViewModel extends BaseViewModel {
  List<CategoryModel> list = [];

  @override
  void refresh() async {
    HttpManager().getData(
      Url.categoryUrl,
      success: (result) {
        list = (result as List)
            .map((model) => CategoryModel.fromJson(model))
            .toList();
        viewState = ViewState.loaded;
      },
      fail: (e) {
        ToastUtil.showError(e.toString());
        viewState = ViewState.error;
      },
      complete: () => notifyListeners(),
    );
  }
}