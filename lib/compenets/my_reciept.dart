import 'package:flutter/material.dart';
import 'package:my_flutter/model/restuarant.dart';
import 'package:provider/provider.dart';

class MyReciept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Thank you for your order!"),
              SizedBox(height: 25,),
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(15),
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) {
                    return Text(restaurant.displayCartReciapt());
                  },
                ),
              )
            ],
          ),
        ));
  }
}
