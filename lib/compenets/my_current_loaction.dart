import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCurrentLoaction extends StatelessWidget {
  const MyCurrentLoaction({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Your location"),
      content: const TextField(
        decoration: InputDecoration(
          hintText: "Search adrres...",
        ),
      ),
      actions: [
        Row(
          children: [
            MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Cancel"), 
          ),
          const Spacer(),
           MaterialButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Save"), 
          ),
          ],
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child:const Row(
              children: [
                Text(
                  "6901 Hollwood Blv",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}
