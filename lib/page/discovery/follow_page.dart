import 'package:flutter/material.dart';
import 'package:flutter_sample/state/base_list_state.dart';
import 'package:flutter_sample/viewmodel/discovery/follow_viewmodel.dart';
import 'package:flutter_sample/widget/discovery/follow_item_widget.dart';

import '../../model/AutoEntity.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState
    extends BaseListState<Item, FollowViewModel, FollowPage> {
  @override
  Widget getContentChild(FollowViewModel model) => ListView.separated(
    separatorBuilder: (context, index) => Divider(height: 0.5),
    itemCount: model.itemList.length,
    itemBuilder: (context, index) {
      return FollowItemWidget(item: model.itemList[index]);
    },
  );

  @override
  FollowViewModel get viewModel => FollowViewModel();
}