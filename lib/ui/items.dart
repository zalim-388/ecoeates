import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Items extends StatefulWidget {
  final String categories;
  final List<Map<String, dynamic>> Item;

  const Items({super.key, required this.categories, required this.Item});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
// Like
  Set<String> likedItems = {};

  Future<void> Likesave(Map<String, String> item) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> updatelike =
        likedItems.map((item) => jsonEncode(item)).toList();

    await prefs.setStringList("favproduct", updatelike);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList("favproduct") ?? [];

    final loadedItems =
        savedFavorites.map((itemJson) => jsonDecode(itemJson)).toList();

    setState(() {
      likedItems = loadedItems
          .map<String>((item) => item['name']?.toString() ?? '')
          .toSet();
    });
  }

  Future<void> toggleFavorite(Map<String, dynamic> item) async {
    final prefs = await SharedPreferences.getInstance();
    final name = item['name'] ?? '';

    setState(() {
      if (likedItems.contains(name)) {
        likedItems.remove(name);
      } else {
        likedItems.add(name);
      }
    });

    final favoriteItems = likedItems
        .map((name) => widget.Item.firstWhere((e) => e['name'] == name))
        .map((item) => jsonEncode({
              'name': item['name'],
              'image': item['image'],
              'price': item['price'],
            }))
        .toList();

    await prefs.setStringList("favproduct", favoriteItems);
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  // cart

  Future<void> savedata(Map<String, String> cart) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> cartltems = prefs.getStringList("categories") ?? [];

    cartltems.add(jsonEncode(cart));

    prefs.setStringList("categories", cartltems);
    print("r${cartltems}");
  }

  Widget build(BuildContext context) {
    print(" daaaaata${widget.categories}");
    print(widget.Item);
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
            const SizedBox(height: 40),
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
                SizedBox(
                  width: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.categories,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
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
            SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(16),
              height: 900,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.Item.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final vegg = widget.Item[index];
                      return Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 120),
                                      child: IconButton(
                                        onPressed: () {
                                          toggleFavorite(vegg);
                                        },
                                        icon: Icon(
                                          likedItems.contains(vegg['name'])
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color:
                                              likedItems.contains(vegg['name'])
                                                  ? Colors.purple
                                                  : Colors.purple.shade900,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Image.asset(
                                        vegg['image'] ?? '',
                                        height: 50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  vegg['name'] ?? '',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                              //5star
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  vegg['price'] ?? '',
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
                                      onPressed: () {
                                        savedata({
                                          'name': vegg['name'] ?? '',
                                          'image': vegg['image'] ?? '',
                                          'price': vegg['price'] ?? '',
                                        });
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "${vegg['name']} added to cart"),
                                          duration: Duration(seconds: 2),
                                        ));
                                      },
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
                    },
                  ),
                ],
              ),
            ),
          ]))),
    );
  }
}
