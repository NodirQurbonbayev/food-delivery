import 'package:flutter/material.dart';
import 'package:my_flutter/compenets/my_buttons.dart';
import 'package:my_flutter/model/food.dart';
import 'package:my_flutter/model/restuarant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  const FoodPage(this.food, {super.key});

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final Map<Addan, bool> addanSelected = {};
  @override
  void initState() {
    super.initState();
    widget.food.addanList.forEach((addan) {
      addanSelected[addan] = false;
    });
  }

  void addToCart(Food food, Map<Addan, bool> addanSelected) {
    Navigator.pop(context);
    List<Addan> currentAddanList = [];
    for (Addan addan in widget.food.addanList) {
      if (addanSelected[addan] == true) {
        currentAddanList.add(addan);
      }
    }
    context.read<Restaurant>().addToCart(food, currentAddanList);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.food.imagePath),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$${widget.food.price}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        widget.food.description,
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Theme.of(context).colorScheme.secondary),
                      const Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.food.addanList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Addan addan = widget.food.addanList[index];
                            return CheckboxListTile(
                              title: Text(addan.name),
                              subtitle: Text(
                                "\$${addan.price}",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              value: addanSelected[addan] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  addanSelected[addan] = value ?? false;
                                });
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 25),

                      MyButtons(
                          text: "Add to Cart",
                          onTap: () {
                            addToCart(widget.food,addanSelected);
                          }),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
