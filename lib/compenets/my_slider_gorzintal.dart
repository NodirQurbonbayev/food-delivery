import 'dart:ui';
import 'package:flutter/material.dart';

class MySliderGorzintal extends StatefulWidget {
  @override
  _MySliderGorzintalState createState() => _MySliderGorzintalState();
}

class _MySliderGorzintalState extends State<MySliderGorzintal> {
  final List<String> titles = [
    "Cheese Burger",
    "Caesar Salad",
    "Americano Pizza",
    "Lemonade"
  ];
  List<String> images = [
    "assets/images/sliderForImages/slider_cheese_burger.jpg",
    "assets/images/sliderForImages/slider_caeser_salad.jpeg",
    "assets/images/sliderForImages/slider_americano_pizza.jpg",
    "assets/images/sliderForImages/slider_lemanade_drink.jpg",
  ];
  late final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 182,
            child: PageView.builder(
              controller: _pageController,
              itemCount: titles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Container(
                    width: 263,
                    margin: const EdgeInsets.only(right: 20),
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image:  DecorationImage(
                        image: AssetImage(
                          images[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 2.5),
                      child: Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
