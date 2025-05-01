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
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _removeLike(int index) async {
    try {
      final itemName = favItems[index]['name'];
      setState(() {
        favItems.removeAt(index);
      });
      final prefs = await SharedPreferences.getInstance();
      final updatedLikes = favItems.map((item) => jsonEncode(item)).toList();
      await prefs.setStringList("favproduct", updatedLikes);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$itemName removed from likes'),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error removing favorite'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liked Items"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/Splash screen Page.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () => _removeLike(index),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
