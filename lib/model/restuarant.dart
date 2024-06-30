
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter/model/cart_item.dart';
import 'package:my_flutter/model/food.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> menu;
  final List<CartItem> _cart = [];

  Restaurant() : menu = _createMenu();

  static List<Food> _createMenu() {
    return [
      // Burgers
      Food(
        foodCategory: FoodCategory.burgers,
        addanList: [
          Addan(name: "Extra cheese", price: 0.99),
          Addan(name: "Bacon", price: 1.99),
          Addan(name: "Avocado", price: 2.99),
        ],
        name: "Classic Cheeseburger",
        description:
            "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
        imagePath: "assets/images/burgers/cheese_burger.webp",
        price: 10.99,
      ),
      Food(
        foodCategory: FoodCategory.burgers,
        addanList: [
          Addan(name: "Grilled onions", price: 0.99),
          Addan(name: "Jalapenos", price: 1.49),
          Addan(name: "Extra BBQ sauce", price: 1.99),
        ],
        name: "BBQ Bacon Burger",
        description:
            "Smoky BBQ sauce, crispy bacon, and onion rings make this beef burger a savory delight.",
        imagePath: "assets/images/burgers/bbq_burger.jpg",
        price: 10.99,
      ),
      Food(
        foodCategory: FoodCategory.burgers,
        addanList: [
          Addan(name: "Vegan cheese", price: 0.99),
          Addan(name: "Grilled mushrooms", price: 1.49),
          Addan(name: "Hummus Spread", price: 1.99),
        ],
        name: "Veggie Burger",
        description:
            "A hearty veggie patty topped with fresh avocado, lettuce, and tomato served on a whole grain bun.",
        imagePath: "assets/images/burgers/vege_burger.jpg",
        price: 9.49,
      ),
      Food(
        foodCategory: FoodCategory.burgers,
        addanList: [
          Addan(name: "Teriyaki Glaze", price: 0.99),
          Addan(name: "Extra pineapple", price: 0.99),
          Addan(name: "Bacon", price: 1.49),
        ],
        name: "Aloha Burger",
        description:
            "A char-grilled chicken breast topped with a slice of grilled pineapple and Swiss cheese.",
        imagePath: "assets/images/burgers/aloha_burger.jpg",
        price: 9.49,
      ),
      Food(
        foodCategory: FoodCategory.burgers,
        addanList: [
          Addan(name: "Sauteed Mushroom", price: 0.99),
          Addan(name: "Fried Egg", price: 1.49),
          Addan(name: "Spicy Mayo", price: 0.99),
        ],
        name: "Blue Moon Burger",
        description:
            "This burger is a blue cheese lover's dream, featuring a succulent ground beef patty.",
        imagePath: "assets/images/burgers/bluemoon_burger.jpg",
        price: 9.49,
      ),
      // Salads
      Food(
        foodCategory: FoodCategory.salads,
        addanList: [
          Addan(name: "Feta cheese", price: 0.99),
          Addan(name: "Kalamata Olives", price: 1.49),
          Addan(name: "Grilled shrimp", price: 1.99),
        ],
        name: "Greek Salad",
        description:
            "Tomatoes, cucumber, red onions, olives, and feta cheese with olive oil and herbs.",
        imagePath: "assets/images/salads/greek_salad.jpeg",
        price: 8.49,
      ),
      Food(
        foodCategory: FoodCategory.salads,
        addanList: [
          Addan(name: "Grilled chicken", price: 0.99),
          Addan(name: "Anchovies", price: 1.49),
          Addan(name: "Extra Parmesan", price: 1.99),
        ],
        name: "Caesar Salad",
        description:
            "Crisp romaine lettuce, parmesan cheese, croutons, and Caesar dressing.",
        imagePath: "assets/images/salads/caeser_salad.jpg",
        price: 7.49,
      ),
      Food(
        foodCategory: FoodCategory.salads,
        addanList: [
          Addan(name: "Avocado", price: 0.99),
          Addan(name: "Feta cheese", price: 1.49),
          Addan(name: "Grilled chicken", price: 1.99),
        ],
        name: "Quinoa Salad",
        description:
            "Quinoa mixed with cucumbers, tomatoes, bell peppers, and a lemon vinaigrette.",
        imagePath: "assets/images/salads/quinoa_salad.jpg",
        price: 9.99,
      ),
      Food(
        foodCategory: FoodCategory.salads,
        addanList: [
          Addan(name: "Mandarin oranges", price: 0.99),
          Addan(name: "Almond slivers", price: 1.49),
          Addan(name: "Extra teriyaki chicken", price: 1.99),
        ],
        name: "Asian Sesame Salad",
        description:
            "Delight in the flavors of the East with this sesame-infused salad, including mixed greens.",
        imagePath: "assets/images/salads/asiansesame_salad.jpg",
        price: 9.99,
      ),
      Food(
        foodCategory: FoodCategory.salads,
        addanList: [
          Addan(name: "Sour Cream", price: 0.99),
          Addan(name: "Pico de Gallo", price: 1.49),
          Addan(name: "Guacamole", price: 1.99),
        ],
        name: "Southwest Chicken Salad",
        description:
            "This colorful salad combines the zesty flavors of the Southwest with mixed greens.",
        imagePath: "assets/images/salads/southwest_salad.jpg",
        price: 9.99,
      ),
      // pizza
      Food(
        foodCategory: FoodCategory.pizza,
        addanList: [
          Addan(name: "Cheese Sauce", price: 0.99),
          Addan(name: "Marinara Sauce", price: 1.49),
          Addan(name: "Buffalo Sauce", price: 1.99),
        ],
        name: "Chicago Style Pizza",
        description: "Chicago-style pizza usually refers to deep-dish pizza, which is a thick pizza baked in a pan and layered with cheese, fillings like meat and vegetables, and sauce",
        imagePath: "assets/images/pizza/chicaco_pizza.jpg",
        price: 4.99,
      ),
      Food(
        foodCategory: FoodCategory.pizza,
        addanList: [
          Addan(name: "Spicy Red Sauce", price: 0.99),
          Addan(name: "BBQ Sauce", price: 1.49),
          Addan(name: "Alfredo Sauce", price: 1.99),
        ],
        name: "Brick Oven Pizza",
        description: "Golden and crispy onion rings perfect for dipping.",
        imagePath: "assets/images/pizza/brick_oven_pizza.jpg",
        price: 3.99,
      ),
      Food(
        foodCategory: FoodCategory.pizza,
        addanList: [
          Addan(name: "Pesto Sauce", price: 0.99),
          Addan(name: "Chocolate Sauce", price: 1.49),
          Addan(name: "Marianara Sauce", price: 1.99),
        ],
        name: "Italian Pizza",
        description:
            "Pizza may be a national food of Italy, but there is no national pizza of Italy. Consensus is limited to a single point: My pizza is better than yours.",
        imagePath: "assets/images/pizza/italian_pizza.jpg",
        price: 4.49,
      ),
      Food(
        foodCategory: FoodCategory.pizza,
        addanList: [
          Addan(name: "Peppery Red Sauce", price: 0.99),
          Addan(name: "Sweet Pizza Sauces", price: 1.49),
          Addan(name: "Spicy Red Sauces", price: 0.99),
        ],
        name: "Neapolitan Pizza",
        description:
            "This style of pizza is prepared with simple and fresh ingredients: a basic dough, raw tomatoes, fresh mozzarella cheese, fresh basil, and olive oil. ",
        imagePath: "assets/images/pizza/neapolitan_pizza.jpg",
        price: 4.49,
      ),
      Food(
        foodCategory: FoodCategory.pizza,
        addanList: [
          Addan(name: "Creamy Alfredo Sauce", price: 0.99),
          Addan(name: "Pomi Pizza Sauce", price: 1.49),
          Addan(name: "Contadina Pizza Sauce", price: 0.99),
        ],
        name: "Peperroni Pizza",
        description:
            "Peperroni pizza is a special serving of the liquid content of the liquid content of",
        imagePath: "assets/images/pizza/peperonni_pizza.jpg",
        price: 4.49,
      ),
      // Drinks
      Food(
        foodCategory: FoodCategory.drinks,
        addanList: [],
        name: "Coca-Cola",
        description: "Classic Coca-Cola soft drink.",
        imagePath: "assets/images/drinks/coca_cola_drinks.jpg",
        price: 1.99,
      ),
      Food(
        foodCategory: FoodCategory.drinks,
        addanList: [],
        name: "Pepsi",
        description: "Refreshing Pepsi soft drink.",
        imagePath: "assets/images/drinks/pepsi_drinks.jpg",
        price: 1.99,
      ),
      Food(
        foodCategory: FoodCategory.drinks,
        addanList: [],
        name: "Latte",
        description: "A latte or caffè latte is a milk coffee that boasts a silky layer of foam as a real highlight to the drink.",
        imagePath: "assets/images/drinks/latte_drinks.webp",
        price: 2.99,
      ),
      Food(
        foodCategory: FoodCategory.drinks,
        addanList: [],
        name: "Mohito",
        description: "Chilled Mohito with a hint of mint.",
        imagePath: "assets/images/drinks/mohito_drinks.jpg",
        price: 2.49,
      ),
      Food(
        foodCategory: FoodCategory.drinks,
        addanList: [],
        name: "Asu",
        description: "Refreshing iced tea with a slice of lemon.",
        imagePath: "assets/images/drinks/asu_water.jpg",
        price: 1.99,
      ),
    ];
  }

  List<CartItem> get cart => _cart;

  void addToCart(Food food, List<Addan> selectedAddans) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddan =
          const ListEquality().equals(item.selectedAddan, selectedAddans);
      return isSameFood && isSameAddan;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food,
        selectedAddan: selectedAddans,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addan addan in cartItem.selectedAddan) {
        itemTotal += addan.price;
      }
      totalPrice += itemTotal * cartItem.quantity;
    }
    return totalPrice;
  }

  int totalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String _formatPrice(double price) {
    return "+\$${price.toStringAsFixed(2)}";
  }

  String _formatAddan(List<Addan> addons) {
    return addons
        .map((addan) => "\$${addan.name}(${_formatPrice(addan.price)})")
        .join(",");
  }

  String displayCartReciapt() {
    final reciapt = StringBuffer();
    reciapt.writeln("Here is your receipt"); // Bu metod satrga matn qo'shadi va yangi qatorga o'tadi
    reciapt.writeln(); // Bo'sh qator qo'shadi
    String formatDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    reciapt.writeln(formatDate);
    reciapt.writeln();
    reciapt.writeln("--------------------------------");

    for (final cartItem in _cart) {
        reciapt.writeln("${cartItem.quantity} * ${cartItem.food.name} - \$${cartItem.food.price.toStringAsFixed(2)}");
        if (cartItem.selectedAddan.isNotEmpty) {
            reciapt.writeln("Add-ons: ${_formatAddan(cartItem.selectedAddan)}");
        }
        reciapt.writeln();
    }

    reciapt.writeln("--------------------------------");
    reciapt.writeln();
    reciapt.writeln("Total items: ${totalItemCount()}");
    reciapt.writeln("Total price: ${_formatPrice(getTotalPrice())}");
    return reciapt.toString();
}

}
