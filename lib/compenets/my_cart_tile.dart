import 'package:flutter/material.dart';
import 'package:my_flutter/compenets/my_buttons.dart';
import 'package:my_flutter/compenets/my_quantity_selector.dart';
import 'package:my_flutter/model/cart_item.dart';
import 'package:my_flutter/model/restuarant.dart';
import 'package:my_flutter/pages/payments_page.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.food.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            '\$${cartItem.food.price.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    MyQuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onIncrement: () => restaurant.addToCart(
                        cartItem.food, cartItem.selectedAddan),
                      onDecrement: () => restaurant.removeFromCart(cartItem),
                    ),
                  ],
                ),
              ),
              if (cartItem.selectedAddan.isNotEmpty)
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8.0),
                    children: cartItem.selectedAddan.map((addan) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(addan.name),
                              Text(
                                ' \$${addan.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          shape: const StadiumBorder(
                            side: BorderSide(color: Colors.black),
                          ),
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          onSelected: (value) {
                            // Handle chip selection
                          },
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyButtons(
                  text: "Go to checkout",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
