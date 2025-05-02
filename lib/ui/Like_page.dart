import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  State<LikePage> createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  List<Map<String, String>> favItems = [];

  @override
  void initState() {
    super.initState();
    _loadLikes();
  }

  Future<void> _loadLikes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedFavorites = prefs.getStringList("favproduct") ?? [];
      setState(() {
        favItems = savedFavorites
            .map((itemJson) => Map<String, String>.from(jsonDecode(itemJson)))
            .toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error loading favorites'),
        ),
      );
    }
  }

  Future<void> removelikeitem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favItems.removeAt(index);
    });
    final updatedList = favItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('favproduct', updatedList);
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
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
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
                const Text('Liked Items',
                    style: TextStyle(fontSize: 17, color: Colors.white)),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Icon(Icons.menu_rounded, color: Colors.purple.shade900),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: favItems.isEmpty
                  ? const Center(
                      child: Text(
                        'No liked items yet.',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: favItems.length,
                      itemBuilder: (context, index) {
                        final item = favItems[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: ListTile(
                            leading: Image.asset(
                              item['image'] ?? '',
                              width: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error),
                            ),
                            title: Text(item['name'] ?? 'Unknown'),
                            subtitle: Text(item['price'] ?? 'N/A'),
                            trailing: IconButton(
                              icon:
                                  const Icon(Icons.favorite, color: Colors.red),
                              onPressed: () => removelikeitem(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
