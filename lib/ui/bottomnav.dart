import 'package:ecoeates/ui/Home_Page.dart';
import 'package:ecoeates/ui/Like_page.dart';
import 'package:ecoeates/ui/cart_page.dart';
import 'package:ecoeates/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, 'Home'),
            _buildNavItem(1, Icons.favorite_border_outlined, 'Favorite'),
            _buildNavItem(2, Icons.shopping_cart_outlined, 'Cart'),
            _buildNavItem(3, Icons.person_outline_outlined, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = currentPage == index;
    
    return InkWell(
      onTap: () {
        setState(() {
          currentPage = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon with conditional styling
          Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.purple.shade900 : Colors.grey,
          ),
          
          // Text label
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.purple.shade900 : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}