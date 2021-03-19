import 'package:flutter/material.dart';
import 'package:flutterexample/pulltore_fresh.dart';
import 'package:flutterexample/shop_message.dart';

class ShopGoodsList extends StatefulWidget {
  @override
  _ShopGoodsList createState() => _ShopGoodsList();
}

class _ShopGoodsList extends State<ShopGoodsList> {
  TriggerPullController triggerPullController = TriggerPullController();

  List<Widget> widgetList = [];

  ScrollController controller = ScrollController();

  ScrollPhysics scrollPhysics = RefreshAlwaysScrollPhysics();

  final Map shop_message = {
    'seller_id': '12345',
    'shop_name': 'flutter',
    'shop_pic': 'https://flutter.cn/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
    'shop_type': true,
    'desc_score': '4.9',
    'ship_score': '4.9',
    'service_score': '4.9',
  };

  double mediaSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((context) {
      triggerPullController.triggerPull();
    });

    super.initState();
  }

  @override
  void dispose() {
    if (this.mounted) {
      controller.dispose();
    }
    super.dispose();
  }

  Future _loadData(bool isPullDown) async {
    if (isPullDown) {
      List<Widget> _shopMessageList = [
        ShopMessage(shop_message: shop_message),
      ];
      setState(() {
        widgetList.addAll(_shopMessageList);
      });
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PullAndPush(
        // 简单的配置头部和底部的样式。
        defaultRefreshBoxTextColor: Color(0xff666666),
        defaultRefreshBoxBackgroundColor:
        Theme.of(context).scaffoldBackgroundColor,
        // 可通过此对象的方法调用触发下拉刷新。
        triggerPullController: triggerPullController,
        // 用于上下拉的滑动控件。
        listView: ListView.builder(
          itemCount: widgetList.length,
          controller: controller,
          physics: scrollPhysics,
          itemBuilder: (BuildContext context, int index) {
            return widgetList[index];
          },
        ),
        // 加载数据的回调。
        loadData: (isPullDown) async {
          // `isPullDown`为`true`时表示下拉刷新，为`false`时表示上拉加载。
          await _loadData(isPullDown);
        },
        // 列表视图（`ListView`）组件中的滚动物理（`scrollPhysics`）组件发生改变时回调。
        scrollPhysicsChanged: (ScrollPhysics physics) {
          // 通过`setState()`方法改变列表视图（`ListView`）组件的物理（`Physics`）属性。
          setState(() {
            // 这个不用改，照抄即可。
            scrollPhysics = physics;
          });
        },
      ),
    );
  }
}
