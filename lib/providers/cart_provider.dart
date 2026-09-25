import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/coffee_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get tax => subtotal * 0.08;

  double get total => subtotal + tax;

  void addItem(CoffeeItem item, String size, String milk, int sugars) {
    final index = _items.indexWhere(
      (i) => i.item.id == item.id && i.size == size && i.milk == milk && i.sugars == sugars,
    );

    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(
        item: item,
        size: size,
        milk: milk,
        sugars: sugars,
      ));
    }
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int delta) {
    _items[index].quantity += delta;
    if (_items[index].quantity <= 0) {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
