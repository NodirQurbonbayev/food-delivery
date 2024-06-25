import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/auth/login_or_register.dart';
import 'package:my_flutter/compenets/my_drawer_Tile.dart';
import 'package:my_flutter/pages/settings_Page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25),
            child: Divider(
              color: Color.fromARGB(255, 30, 30, 30),
            ),
          ),
          MyDrawerTile(
              text: "H O M E",
              data: CupertinoIcons.home,
              ontap: () {
                Navigator.pop(context);
              }),
          MyDrawerTile(
              text: "S E T T I N G S",
              data: CupertinoIcons.settings,
              ontap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }),
          Spacer(),
          MyDrawerTile(
              text: "L O G  O U T",
              data: Icons.logout,
              ontap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginOrRegisterUser()));
              }),
        ],
      ),
    );
  }
}
