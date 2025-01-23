import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  final String categories;
  final List<Map<String, dynamic>> Item;

  const Items({super.key, required this.categories, required this.Item});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  bool fav = false;

  // void favorite() {
  //   setState(() {
  //     fav = !fav;
  //   });
  // }

  Set<String> favoriteItems = {};

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
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Veggies',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.menu_rounded,
                      color: Colors.purple.shade900,
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
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              String itemName =
                                                  vegg['name'] ?? '';
                                              if (favoriteItems
                                                  .contains(itemName)) {
                                                favoriteItems.remove(itemName);
                                              } else {
                                                favoriteItems.add(itemName);
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            favoriteItems.contains(
                                                    vegg['name'] ?? '')
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 20,
                                            color: favoriteItems.contains(
                                                    vegg['name'] ?? '')
                                                ? Colors.deepPurpleAccent
                                                : Color(0xFFC3B2FF),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      vegg['image'] ?? '',
                                      height: 60,
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
                    },
                  ),
                ],
              ),
            ),
          ]))),
    );
  }
}
