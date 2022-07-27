import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'meal_page.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      body: ZoomDrawer(
        angle: 0.0,
        mainScreen: MealPage(),
        menuScreen: MenuPage(),
      ),
    );
  }
}
