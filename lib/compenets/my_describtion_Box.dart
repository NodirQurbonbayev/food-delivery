import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myPrimaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    final mySecondaryTextStyle = TextStyle(color: Theme.of(context).colorScheme.secondary);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "\$0.99",
                style: myPrimaryTextStyle,
              ),
              Text(
                "Delivery fee",
                style: mySecondaryTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "\$0.99",
                style: myPrimaryTextStyle,
              ),
              Text(
                "Delivery time",
                style: mySecondaryTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
