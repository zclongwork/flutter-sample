import 'package:flutter_sample/http/Url.dart';
import 'package:flutter_sample/model/AutoEntity.dart';
import 'package:flutter_sample/viewmodel/base_list_viewmodel.dart';

class FollowViewModel extends BaseListViewModel<Item, Issue> {
  @override
  String getUrl() {
    return Url.followUrl;
  }

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }
}