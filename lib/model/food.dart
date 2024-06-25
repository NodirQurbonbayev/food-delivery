enum FoodCategory {
  burgers,
  salads,
  pizza,
  drinks,
}

class Addan {
  final String name;
  final double price;

  Addan({required this.name, required this.price});
}

class Food {
  final FoodCategory foodCategory;
  final List<Addan> addanList;
  final String name;
  final String description;
  final String imagePath;
  final double price;

  Food({
    required this.foodCategory,
    required this.addanList,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });
}