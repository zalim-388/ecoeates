import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'image/Frame 12.png',
    'image/fresh-vegetables-banner-horizont.png',
    'image/images.png',
    'image/good-food-fresh-and-healthy-farm.png',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(item),
            ))
        .toList();
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/Splash screen Page.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.purple.shade900,
                        ))),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    )),
                Text(
                  'Location \n Malappuram,Kerala',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                SizedBox(
                  width: 35,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        child: Icon(
                          Icons.menu_rounded,
                          color: Colors.purple.shade900,
                        ))),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.purple.shade900,
                  ),
                  hintText: 'Search Groceries',
                  hintStyle: TextStyle(color: Colors.purple.shade900),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  filled: true,
                  fillColor: Colors.white),
            ),
            SizedBox(height: 16),
            CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    ));
  }
}
