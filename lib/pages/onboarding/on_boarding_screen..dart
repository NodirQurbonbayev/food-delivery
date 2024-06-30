import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:my_flutter/auth/login_or_register.dart';
import 'package:my_flutter/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Color kDarkBlueColor = const Color(0xFF053149);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInScreen()));
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
      body: OnBoardingSlider(
        totalPage: 3,
        controllerColor: Colors.red,
        headerBackgroundColor: Colors.blue,
        background: [
          Image.asset(
            "assets/images/onBoardingImage/onboarding_image.png",
            fit: BoxFit.cover,
            height: 400,
          ),
          Image.asset(
            "assets/images/onBoardingImage/map_marker.png",
            fit: BoxFit.cover,
            height: 400,
          ),
          Image.asset(
            "assets/images/onBoardingImage/food_delivery.png",
            fit: BoxFit.cover,
            height: 400,
          ),
        ],
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: kDarkBlueColor,
        ),
        onFinish: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignInScreen()));
        },
        finishButtonText: "Get Started",
        speed: 1.8,
        pageBodies: [
          buildPageBody(
            context,
            'Get Food Delivered\nto Your Doorstep',
            'Experience the convenience of having your favorite meals delivered right to your home.',
          ),
          buildPageBody(
            context,
            'Track Your Order in Real-Time',
            'Stay updated with real-time tracking of your order from the restaurant to your doorstep.',
          ),
          buildPageBody(
            context,
            'Enjoy Your Meal',
            'Savor your meal knowing it was prepared and delivered with care.',
          ),
        ],
      ),
    );
  }

  Widget buildPageBody(BuildContext context, String text, String title) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 440),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFF053149),
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),  // Adding some space between the texts
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
