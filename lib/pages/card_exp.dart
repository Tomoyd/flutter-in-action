import 'package:flutter/material.dart';
import 'package:myapp/model/shop/shop_car.dart';
import 'package:myapp/pages/provider_widget.dart';

/// 购物车示例
class ShopCarPage extends StatefulWidget {
  ShopCarPage({Key key}) : super(key: key);

  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("购物车")),
      body: Center(
          child: ChangeNotifierProvider(
        data: CarModel(),
        child: GoodsConsumer<CarModel>(builder: (context, cart) {
          return Column(
              children: [Text("总价：￥${cart.totalPrice}"), AddGoodsItem()]);
        }),
      )),
    );
  }
}

class AddGoodsItem extends StatefulWidget {
  AddGoodsItem({Key key}) : super(key: key);

  @override
  _AddGoodsItemState createState() => _AddGoodsItemState();
}

class _AddGoodsItemState extends State<AddGoodsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          onPressed: () {
            ChangeNotifierProvider.of<CarModel>(context, hasDependence: false)
                .add(GoodsItem.fromJson({"count": 1, "price": 2.0}));
          },
          child: Text("添加商品")),
    );
  }
}
