import 'package:my_flutter/model/food.dart';

class CartItem {
  final Food food;
  final List<Addan> selectedAddan;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddan,
    this.quantity = 1,
  });

  double get totalPrice {
    double addanPrice =
        selectedAddan.fold(0.0, (sum, addon) => sum + addon.price);
    return (food.price + addanPrice) * quantity;
  }
}
