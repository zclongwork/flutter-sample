import 'package:flutter_sample/model/page_model.dart';

import 'AutoEntity.dart';

class IssueEntity extends PageModel<Item> {
  int? nextPublishTime;
  String? newestIssueType;
  List<Issue>? issueList = [];

  IssueEntity({
    this.nextPublishTime,
    this.newestIssueType,
  });

  IssueEntity.fromJson(Map<String, dynamic> json) {
    nextPublishTime = json['nextPublishTime'];
    newestIssueType = json['newestIssueType'];
    nextPageUrl = json['nextPageUrl'];
    if (json['issueList'] != null) {
      issueList = [];
      itemList = [];
      (json['issueList'] as List).forEach((v) {
        issueList?.add(Issue.fromJson(v));
      });
      itemList = issueList?[0].itemList!;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextPublishTime'] = nextPublishTime;
    data['newestIssueType'] = newestIssueType;
    data['nextPageUrl'] = nextPageUrl;
    if (issueList != null) {
      data['issueList'] = issueList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}