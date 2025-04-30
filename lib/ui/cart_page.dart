import 'dart:convert';

import 'package:ecoeates/ui/checkoutpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [];

  @override
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
    for (var item in cartItems) {
      if (item["price"] is num) {
        total += (item['price'] as num).toDouble();
      } else {
        String priceStr =
            item['price'].toString().replaceAll(RegExp(r'[^\d.]'), '');
        total += double.tryParse(priceStr) ?? 0.0;
      }
    }
    return total;
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
    saveData();
  }

  @override
  Widget build(BuildContext context) {
    double itemTotal = getTotal();
    double deliveryCharges = 20.0;
    double totalAmount = itemTotal + deliveryCharges;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/Splash screen Page.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header Row
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back_ios_new_outlined,
                            color: Colors.purple.shade900),
                      ),
                    ),
                    const SizedBox(width: 60),
                    Text('Cart',
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.menu_rounded,
                            color: Colors.purple.shade900),
                      ),
                    ),
                  ],
                ),
              ),

              // Cart List
              Expanded(
                child: cartItems.isEmpty
                    ? Center(
                        child: Text(
                          "Your cart is empty!",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          var item = cartItems[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: ListTile(
                              leading: item['image'] != null
                                  ? Image.asset(item['image'],
                                      width: 50, height: 50, fit: BoxFit.cover)
                                  : const Icon(Icons.image_not_supported),
                              title: Text(item['name'] ?? 'Unnamed'),
                              subtitle: Text("${item['price'].toString()}"),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => removeItem(index),
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Price Summary
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Items total",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade900),
                        ),
                        const Spacer(),
                        Text("₹${itemTotal.toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Delivery charges",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple.shade900),
                        ),
                        const Spacer(),
                        const Text("₹20.00",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                      ],
                    ),
                    const Divider(height: 30),
                    Row(
                      children: [
                        const Text(
                          "Total Amount",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                        const Spacer(),
                        Text("₹${totalAmount.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                height: 90,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.vertical(
                  //   bottom: Radius.circular(20),
                  // ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: ₹${totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: cartItems.isEmpty
                            ? null
                            : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Checkoutpage(
                                          totalAmount: totalAmount)),
                                );
                              },
                        child: const Text("Checkout",
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
