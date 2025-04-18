import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_sample/practice/provider/provider.dart';

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProviderRouteState();
  }
}

class _ProviderRouteState extends State<ProviderRoute> {
  final ValueNotifier<int> a = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    // return ValueListenableBuilder(
    //   valueListenable: a,
    //   builder: (ctx, value, child) {
    //     return Center(
    //       child: Column(
    //         children: [
    //           Text('$value'),
    //           child!,
    //         ],
    //       ),
    //     );
    //   },
    //   child:ElevatedButton(
    //       onPressed: () {
    //         a.value++;
    //         // ChangeNotifierProvider.of<CartModel>(context,
    //         //     listen: true)
    //         //     .add(Item(20, 1));
    //       },
    //       child: Text("添加商品")) ,
    // );

    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(
          builder: (context) {
            return Column(
              children: <Widget>[
                Builder(builder: (context) {
                  var cart = ChangeNotifierProvider.of<CartModel>(context);
                  return Text("总价：${cart.totalPrice}");
                }),
                // 优化后上方代码可以替换为
                // Consumer<CartModel>(builder: (context, cart) {
                //   return Text("总价：${cart.totalPrice}");
                // }),
                Builder(builder: (context) {
                  print("ElevatedButton build"); //在后面优化部分会用到
                  return ElevatedButton(
                      onPressed: () {
                        ChangeNotifierProvider.of<CartModel>(context,
                                listen: false)
                            .add(Item(20, 1));
                      },
                      child: Text("添加商品"));
                })
              ],
            );
          },
        ),
      ),
    );
  }
}

// 要跨组件共享的model类
class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  List<Item> itemList = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(itemList);

  // 购物车中商品的总价
  double get totalPrice =>
      itemList.fold(0, (value, item) => value + item.price * item.count);

  // 将商品添加到购物车，如果商品已经存在则只增加数量
  void add(Item item) {
    itemList.add(item);
    notifyListeners();
  }
}

class Item {
  Item(this.price, this.count);

  double price;
  int count;
}
