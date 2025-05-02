import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Profile Page",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "salim",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Text(
                    "salim3321@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              '43',
                              style: TextStyle(
                                color: Color(0xFF6A1B9A),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Orders',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 30,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              '12',
                              style: TextStyle(
                                color: Color(0xFF6A1B9A),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Crates',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 30,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                color: Color(0xFF6A1B9A),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Active',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            __buildInfoSection(context),
    SizedBox(height: 20.h),

           _buildOptionsSection(context)
          ],
        ),
      ),
    );
  }

  Widget __buildInfoSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          _buildRow(Icons.phone, 'Phone', '9562791690'),
          const Divider(height: 20),
          _buildRow(Icons.location_on, 'Address',
              '123 Grocery Lane, Food City, FC 12345'),
          const Divider(height: 20),
          _buildRow(Icons.credit_card, 'Payment', '**** **** **** 1234'),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6A1B9A),
            size: 22,
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.grey,
            size: 16,
          ),
        ),
      ],
    );
  }
}

Widget _buildOptionsSection(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Account Settings',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        __buildOptionCard(
          icon: Icons.favorite_border,
          title: 'Favorites',
          subtitle: 'Your saved items',
          iconColor: Colors.red[400]!,
          iconBgColor: Colors.red[50]!,
        ),
        const SizedBox(height: 15),
        __buildOptionCard(
          icon: Icons.notifications_none,
          title: 'Notifications',
          subtitle: 'Set your notification preferences',
          iconColor: Colors.amber[700]!,
          iconBgColor: Colors.amber[50]!,
        ),
        const SizedBox(height: 15),
        __buildOptionCard(
          icon: Icons.help_outline,
          title: 'Help Center',
          subtitle: 'FAQs and support',
          iconColor: Colors.blue[400]!,
          iconBgColor: Colors.blue[50]!,
        ),
        const SizedBox(height: 15),
        __buildOptionCard(
          icon: Icons.logout,
          title: 'Log Out',
          subtitle: 'Sign out from your account',
          iconColor: Colors.grey[700]!,
          iconBgColor: Colors.grey[200]!,
        ),
      ],
    ),
  );
}

Widget __buildOptionCard(
    {required IconData icon,
    required String title,
    required String subtitle,
    required Color iconColor,
    required Color iconBgColor}) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 3))
          ]),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.grey,
              size: 16,
            ),
          ),
        ],
      ));
}
