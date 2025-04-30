import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Checkoutpage extends StatefulWidget {
  final double totalAmount;
  const Checkoutpage({super.key, required this.totalAmount});

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

enum SingingCharacter { Home, office }

enum upi { googlepay, phonepe }

late Razorpay _razorpay;

class _CheckoutpageState extends State<Checkoutpage> {
  SingingCharacter? _character = SingingCharacter.Home;
  upi? _upi = upi.googlepay;

  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlepaymentsuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlepaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleexternalwallet);
  }

  void _handlepaymentsuccess(PaymentSuccessResponse response) {
    print('payment successful:l${response.paymentId}');
  }

  void _handlepaymentError(PaymentFailureResponse response) {
    print('payment error:l${response.code} - ${response.message}');
  }

  void _handleexternalwallet(ExternalWalletResponse response) {
    print('external wallet:l${response.walletName}');
  }

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          const Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Add new",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Card(
                        child: ListTile(
                          leading: Radio<SingingCharacter>(
                              value: SingingCharacter.Home,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              }),
                          title: Text(
                            'Home',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                              )),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Radio<SingingCharacter>(
                              value: SingingCharacter.office,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              }),
                          title: Text(
                            'office',
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                              )),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          const Text(
                            "payment",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Add now",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Image.asset(
                                  "image/g pay 1.png",
                                  fit: BoxFit.contain,
                                ),
                                Text("Google pay",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Radio<upi>(
                                  value: upi.googlepay,
                                  groupValue: _upi,
                                  onChanged: (upi? value) {
                                    setState(() {
                                      _upi = value;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      "image/phone pay 1.png",
                                      fit: BoxFit.contain,
                                    ),
                                    Text("Phone pe",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Radio<upi>(
                                      value: upi.phonepe,
                                      groupValue: _upi,
                                      onChanged: (upi? value) {
                                        setState(() {
                                          _upi = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                      Container(
                        height: 90.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total Amount",
                                  style: TextStyle(color: Colors.purple),
                                ),
                                Text(
                                    "₹${widget.totalAmount.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.black)),
                              ],
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            SizedBox(
                              height: 50.h,
                              width: 160.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {
                                  showPaymentSuccessDialog(context, "12345");
                                },
                                child: Text("payment",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showPaymentSuccessDialog(BuildContext context, String orderId) {
  showDialog(
    context: context,
    barrierDismissible: false, // Tap outside won't dismiss
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                  radius: 40,
                  child: Image.asset(
                    "image/Group 18.png",
                    fit: BoxFit.contain,
                  )),
              const SizedBox(height: 20),

              // Title
              const Text(
                "Order Successful",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Your Order #$orderId is Successfully Placed",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Add your logic for "Track My Order"
                },
                child: const Text(
                  "Track My Order",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),

              const SizedBox(height: 15),

              // Go Back Button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(color: Colors.deepPurple),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // Add your logic for going back
                },
                child: const Text(
                  "Go Back",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
