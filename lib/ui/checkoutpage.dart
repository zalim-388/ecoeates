import 'package:flutter/material.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/Splash screen Page.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          AppBar(
            leading: Padding(
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
            title: Text(
              'Checkout',
              style: TextStyle(fontSize: 17, color: Colors.white),
            ),
            actions: [
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
          Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Address",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Add now",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
