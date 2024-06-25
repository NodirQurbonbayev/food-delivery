import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

 const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText, 
    required this.controller, required String? Function(dynamic value) validator,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)
      ),
    )
    );
  }
}
