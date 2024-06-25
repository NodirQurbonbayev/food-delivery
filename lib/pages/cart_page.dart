import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/compenets/my_cart_tile.dart';
import 'package:my_flutter/model/restuarant.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final userCart = restaurant.cart;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                       return AlertDialog(
                          title:const  Text("Are you sure want to clear the cart"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  restaurant.clearCart();
                                },
                                child: const Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("No"))
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
                      final cartItem = userCart[index];
                      return MyCartTile(cartItem: cartItem);
                    }))
          ],
        ),
      );
    });
  }
}
