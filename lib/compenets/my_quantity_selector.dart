import 'package:flutter/material.dart';
import 'package:my_flutter/model/food.dart';

class MyQuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  const MyQuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement,
  });
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                quantity.toString(),
              ),
            ),
          ),
           GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
