import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  final String name;
  final String image;
  final String price;
  const Items(
      {super.key,
      required this.name,
      required this.image,
      required this.price});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  // List<Map<String, String>> vegg = [];

  @override
  // void initState() {
  //   super.initState();
  //   vegg = [
  //     {"name": widget.name, "image": widget.image, "price": widget.price},
  //   ];
  // }

  Widget build(BuildContext context) {
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
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Image.asset(widget.image),
                            ],
                          ),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          widget.price,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ]))),
    );
  }
}
