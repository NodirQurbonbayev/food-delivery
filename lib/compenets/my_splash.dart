import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySplashDescription extends StatelessWidget {
  final String imageOnBoarding;
  final String titleOnBoarding;
  final String buttonTitleOnBoarding;
  final void Function()? ontapOnBoarding;

  const MySplashDescription({
    Key? key,
    required this.imageOnBoarding,
    required this.titleOnBoarding,
    required this.buttonTitleOnBoarding,
    this.ontapOnBoarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(imageOnBoarding,width: 230,),
            ),
          ),
          SizedBox(height: 190),
          Text(
            titleOnBoarding,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: ontapOnBoarding,
            child: Container(
              width: 430,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                buttonTitleOnBoarding,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
