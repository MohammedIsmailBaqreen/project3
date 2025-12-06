import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Text(
          "مرحباً بك يا $username 👋",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
