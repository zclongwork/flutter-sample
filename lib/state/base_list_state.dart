//通用分页State封装
import 'package:flutter/material.dart';
import 'package:flutter_sample/model/page_model.dart';
import 'package:flutter_sample/viewmodel/base_list_viewmodel.dart';
import 'package:flutter_sample/widget/loading_state_widget.dart';
import 'package:flutter_sample/widget/provider_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

/// State
abstract class BaseListState<L, M extends BaseListViewModel<L, PageModel<L>>,
        T extends StatefulWidget> extends State<T>
    with AutomaticKeepAliveClientMixin {

  M get viewModel; //真实获取数据的仓库

  Widget getContentChild(M model); //真实的分页控件

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProviderWidget<M>(
        model: viewModel,
        onModelInit: (model) => model.refresh(),
        builder: (context, model, child) {
          return LoadingStateWidget(
            viewState: model.viewState,
            onReload: model.retry,
            child: Container(
              color: Colors.white,
              child: SmartRefresher(
                controller: model.refreshController,
                onRefresh: model.refresh,
                onLoading: model.loadMore,
                enablePullUp: true,
                // 显示的界面
                child: getContentChild(model),
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
