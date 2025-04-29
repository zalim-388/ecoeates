import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [];

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartItemsString = prefs.getStringList("categories") ?? [];
    setState(() {
      cartItems = cartItemsString
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> updatedItems =
        cartItems.map((item) => jsonEncode(item)).toList();
    prefs.setStringList("categories", updatedItems);
  }

double getTotal() {
  double total = 0;
  for (var i = 0; i < cartItems.length; i++) {
    var price = cartItems[i]['price'];
    // Ensure the price is a number, if not try parsing it as a double
    total += double.tryParse(price.toString()) ?? 0.0;
  }
  return total;
}


  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    saveData();
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
    saveData();
  }

  void addItem(Map<String, dynamic> item) {
    setState(() {
      cartItems.add(item);
    });
    saveData();
  }

  @override
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
        child: Stack(
          children: [
            Column(children: [
              const SizedBox(height: 40), // Optional spacing
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.asset(cartItems[index]['image']),
                        title: Text(cartItems[index]['name']),
                        subtitle: Text(cartItems[index]['price'].toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                            saveData();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),

              Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Items total",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple.shade900,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "₹${getTotal().toStringAsFixed(2)}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "delivery charges",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple.shade900,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "₹20.00",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple),
                            ),
                            Spacer(),
                            Text("₹${(getTotal() + 20).toStringAsFixed(2)}")
                          ],
                        )
                      ],
                    ),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}
