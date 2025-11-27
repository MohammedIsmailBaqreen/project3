// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الحساب"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 194, 218, 238),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: Colors.blueGrey),
            SizedBox(height: 20),
            Text(
              "صفحة الحساب",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
