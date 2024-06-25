import 'package:flutter/material.dart';
import 'package:my_flutter/compenets/my_current_loaction.dart';
import 'package:my_flutter/compenets/my_describtion_Box.dart';
import 'package:my_flutter/compenets/my_drawer.dart';
import 'package:my_flutter/compenets/my_food_tile.dart';
import 'package:my_flutter/compenets/my_sliver_appBar.dart';
import 'package:my_flutter/compenets/my_tabbar.dart';
import 'package:my_flutter/model/food.dart';
import 'package:my_flutter/model/restuarant.dart';
import 'package:my_flutter/pages/food_pages.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.foodCategory == category).toList();
  }

  List<Widget> getFoodByCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Food food = categoryMenu[index];
          return MyFoodTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FoodPage(food)));
            },
            food: food,
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            MySliverAppbar(
              title: MyTabbar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    endIndent: 25,
                    indent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  MyCurrentLoaction(),
                  MyDescriptionBox(),
                ],
              ),
            ),
          ];
        },
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) {
            List<Widget> tabViews = getFoodByCategory(restaurant.menu);
            return TabBarView(
              controller: _tabController,
              children: tabViews,
            );
          },
        ),
      ),
    );
  }
}
