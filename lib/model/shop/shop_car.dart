import 'package:myapp/pages/provider_widget.dart';

class GoodsItem {
  GoodsItem();
  double price;
  int count;

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem()
      ..price = json["price"]
      ..count = json["count"];
  }

  Map<String, dynamic> toJson() {
    return {"price": this.price, "count": this.count};
  }
}

class CarModel extends ChangeNotifier {
  final List<GoodsItem> _items = [];

  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  void add(GoodsItem goods) {
    _items.add(goods);
    notifyListeners();
  }
}
