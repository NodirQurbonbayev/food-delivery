import 'package:flutter/material.dart';
import 'package:my_flutter/auth/login_or_register.dart';
import 'package:my_flutter/model/restuarant.dart';
import 'package:my_flutter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create: (context)=> ThemeProvider()),
  ChangeNotifierProvider(create: (context)=> Restaurant()),

],
child: const MyApp(),
));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: LoginOrRegisterUser(),
    );
  }
}
