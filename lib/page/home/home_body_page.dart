import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/viewmodel/home/home_page_viewmodel.dart';
import 'package:flutter_sample/widget/provider_widget.dart';

import '../../widget/loading_state_widget.dart';

import 'package:flutter/material.dart' hide CarouselController;

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({super.key});

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends State<HomeBodyPage>
    with AutomaticKeepAliveClientMixin {

  var model =HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ProviderWidget<HomePageViewModel>(
        model: model,
        onModelInit:(model) => model.refresh(),
        builder: (context, model, child) {
          return LoadingStateWidget(
            viewState: model.viewState,
            onReload: model.retry,
            child: _banner(),
          );
        });
  }

  // 当前页面索引
  int _current = 0;

  _banner() {
    return Column(
      children: [
        Expanded(child: Column(
          children: [
            CarouselSlider(
                items: model.bannerList.map((item) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Image.network(item.data!.cover!.feed!),
                    // child: Image.network("http://ali-img.kaiyanapp.com/ed58ca1331472440da3bc7a2100746ad.png?imageMogr2/quality/60/format/jpg"),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) => {
                    setState(() {
                      _current = index;
                    })
                  }
                  ),
                ),
            // 轮播指示器
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: model.bannerList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _current = entry.key,
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 5.0,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key? Colors.blue
                          : Colors.grey,
                    )
                  )
                );
              }).toList(),
            ),
          ],
        ))
      ]
    );
  }

  @override
  bool get wantKeepAlive => true;

}
