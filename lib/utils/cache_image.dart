import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

//封装带缓存的Image
Widget cacheImage(String url,
    {double? width,
      double? height,
      fit = BoxFit.cover,
    BorderRadius borderRadius = BorderRadius.zero,
    BoxShape shape = BoxShape.rectangle,
    bool clearMemoryCacheWhenDispose = false}) {
  return ExtendedImage.network(
    url,
    shape: shape,
    height: height,
    width: width,
    fit: fit,
    borderRadius: borderRadius,
    //图片从 tree 中移除，清掉内存缓存，以减少内存压力
    clearMemoryCacheWhenDispose: clearMemoryCacheWhenDispose,
  );
}

ImageProvider cachedNetworkImageProvider(String url) {
  return ExtendedNetworkImageProvider(url);
}
