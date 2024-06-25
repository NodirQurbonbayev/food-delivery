import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? data;
  final void Function()? ontap;

  const MyDrawerTile({super.key, required this.text, this.data, this.ontap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(
          data,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        onTap: ontap,
      ),
    );
  }
}
