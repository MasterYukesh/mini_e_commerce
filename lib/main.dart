import 'package:flutter/material.dart';
import 'package:verzeo_minor_project/view/loginpage.dart';
import 'package:verzeo_minor_project/view/shoppage.dart';
import 'package:verzeo_minor_project/view/tabpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginPage(),
        '/tabpage': (context) => const TabPage(),
        '/shoppage': (context) => const ShopPage()
      },
    );
  }
}
