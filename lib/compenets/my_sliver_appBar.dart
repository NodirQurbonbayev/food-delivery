import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/pages/cart_page.dart';

class MySliverAppbar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppbar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      expandedHeight: 349,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          icon: const Icon(CupertinoIcons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
      ],
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
