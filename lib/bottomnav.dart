import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:ecoeates/Home_Page.dart';
import 'package:ecoeates/Like_page.dart';
import 'package:ecoeates/cart_page.dart';
import 'package:ecoeates/profile.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => BottomnavState();
}

class BottomnavState extends State<Bottomnav> {
  int currentPage = 0;
  final List<Widget> _pages = [
    HomePage(),
    LikePage(),
    CartPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 70,
        circleSize: 50,
        initialSelection: currentPage,
        inactiveIconColor: Colors.purple.shade900,
        textColor: Colors.black,
        hasElevationShadows: false,
        barBackgroundColor: Colors.white,
        circleColor: Colors.purple.shade900,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 35,
            title: 'Home',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.favorite_border_outlined,
            iconSize: 35,
            title: 'favorite',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.shopping_cart_outlined,
            iconSize: 35,
            title: 'cart',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.person_outline_outlined,
            iconSize: 35,
            title: 'profile',
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
    );
  }
}
