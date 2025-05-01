import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecoeates/ui/items.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

// List<Map<String, String>> sampleItems = [
//   {'name': 'Tomato', 'price': '\$2', 'image': 'assets/tomato.png'},
//   {'name': 'Potato', 'price': '\$1.5', 'image': 'assets/potato.png'},
// ];

// Items(
//   categories: 'Veggies',
//   Item: sampleItems,
// );

  final List<Map<String, dynamic>> categories = [
    {
      "name": "Veggies",
      "image": "image/veg image 1.png",
      "Items": [
        {
          "name": "tomato",
          "image": "image/tomato 2.png",
          "price": "₹30/kg",
        },
        {
          "name": "onian",
          "image": "image/onian 2.png",
          "price": "₹28/kg",
        },
        {
          "name": "Garlic",
          "image": "image/veluthulli 1.png",
          "price": "₹52/kg",
        },
        {
          "name": "ladyiesfingers",
          "image": "image/vendakka 1.png",
          "price": "₹19/kg",
        },
        {
          "name": "geen chilly",
          "image": "image/green-chilly 1.png",
          "price": "₹25/kg",
        },
        {
          "name": "cabbage",
          "image": "image/cabbage 1.png",
          "price": "₹32/kg",
        },
        {
          "name": "carrot",
          "image": "image/karrot 1.png",
          "price": "₹38/kg",
        },
        {
          "name": "potato",
          "image": "image/potato 1.png",
          "price": "₹35/kg",
        },
      ]
    },
    {
      "name": "Fruits",
      "image": "image/fruits 1.png",
      "Items": [
        {
          "name": "orange",
          "image": "image/orange 1.png",
          "price": "₹90/kg",
        },
        {
          "name": "watermelon",
          "image": "image/watermelon 1.png",
          "price": "₹32/kg",
        },
        {
          "name": "apple",
          "image": "image/unsplash_JV8PcTEK4R0.png",
          "price": "₹110/kg",
        },
        {
          "name": "pinapple",
          "image": "image/unsplash_1ylFhXqy058.png",
          "price": "₹52/kg",
        },
        {
          "name": "banana",
          "image": "image/unsplash_e49C0XDnZM0.png",
          "price": "₹45/kg",
        },
        {
          "name": "grape",
          "image": "image/unsplash_qtwlKiu6VHg.png",
          "price": "₹70/kg",
        },
        {
          "name": "Strawberry ",
          "image": "image/unsplash_ww-40NflRjA.png",
          "price": "₹150/kg",
        },
        {
          "name": "mango",
          "image": "image/mango 1.png",
          "price": "₹75/kg",
        },
      ]
    },
    {"name": "Nuts", "image": "image/nuts 1.png"},
    {
      "name": "Meats",
      "image": "image/meat 1.png",
    },
    {
      "name": "Beverages",
      "image": "image/pngfuel 6 (1).png",
    },
    {
      "name": "Snacks",
      "image": "image/pngfuel 6.pngrt",
    },
    {
      "name": "Dairys",
      "image": "image/Group 6837.png",
    }
  ];


  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
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
          child: SingleChildScrollView(
           
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.purple.shade900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Location \n Malappuram, Kerala',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(
                          Icons.menu_rounded,
                          color: Colors.purple.shade900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.purple.shade900,
                    ),
                    hintText: 'Search Groceries',
                    hintStyle: TextStyle(color: Colors.purple.shade900),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 35),

              Container(
                padding: const EdgeInsets.all(16),
                height: 700,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final item = categories[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print(item['name']);
                  
                                      print(item['items']);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Items(
                                              categories: item['name'],
                                              Item: item['Items'],
                                            ),
                                          ));
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 35,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.deepPurpleAccent,
                                        radius: 30,
                                        child: Image.asset(
                                          item['image'] ?? '',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item['name'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          itemCount: categories.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (Context, index) {
                            final item = categories[index];
                            return Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFC3B2FF),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                20,
                                              ),
                                              topRight: Radius.circular(20))),
                                      child: Column(
                                        children: [
                                   
                                          Center(
                                            child: Image.asset(
                                              item['image'] ?? '',
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item['name'] ?? '',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                    //5star
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        item['price'] ?? '',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.purple.shade800),
                                      ),
                                    ),
                  
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurpleAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(13))),
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
