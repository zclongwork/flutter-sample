import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter/material.dart';
import 'package:flutter_sample/state/base_list_state.dart';
import 'package:flutter_sample/viewmodel/home/home_page_viewmodel.dart';

import '../../model/AutoEntity.dart';
import '../../utils/cache_image.dart';
import '../../widget/list_item_widget.dart';

const TEXT_HEADER_TYPE = 'textHeader';

class HomeBodyPage extends StatefulWidget {
  const HomeBodyPage({super.key});

  @override
  State<HomeBodyPage> createState() => _HomeBodyPageState();
}

class _HomeBodyPageState extends BaseListState<Item, HomePageViewModel, HomeBodyPage> {

  @override
  bool get wantKeepAlive => true;

  @override
  HomePageViewModel get viewModel => HomePageViewModel();

  @override
  Widget getContentChild(HomePageViewModel model) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          // Divider:分割线
          child: Divider(
            height: model.itemList[index].type == TEXT_HEADER_TYPE || index == 0
                ? 0
                : 0.5,
            color: model.itemList[index].type == TEXT_HEADER_TYPE || index == 0
                ? Colors.transparent
                : Color(0xffe6e6e6),
          ),
        );
      },
      itemCount: model.itemList.length,
      // itemCount: 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _banner(model);
        } else {
          if (model.itemList[index].type == TEXT_HEADER_TYPE) {
            return _titleItem(model.itemList[index]);
          }
          return ListItemWidget(item: model.itemList[index]);
        }

     }
    );
  }

  _titleItem(Item item) {
    return Container(
      decoration: BoxDecoration(color: Colors.white24),
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Center(
        child: Text(
          item.data?.text ?? "title",
          style: TextStyle(
            //  bold:粗体
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // 当前页面索引
  int _current = 0;

  _banner(HomePageViewModel model) {
    return Column(
      children: [
        CarouselSlider(
          items: model.bannerList.map((item) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                // child: Image.network(item.data!.cover!.feed!),
                child: cacheImage(
                    item.data!.cover!.feed!,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                  )
              ),
              // child: Image.network("http://ali-img.kaiyanapp.com/ed58ca1331472440da3bc7a2100746ad.png?imageMogr2/quality/60/format/jpg"),
            );
          }).toList(),
          options: CarouselOptions(
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
                  }),
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
                      color: _current == entry.key ? Colors.blue : Colors.grey,
                    )));
          }).toList(),
        ),
      ],
    );
  }

}
