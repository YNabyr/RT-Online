import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPengumuman extends StatelessWidget {
  const DetailPengumuman({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments;
    final String title = args?['title'] ?? '';
    final String date = args?['date'] ?? '';
    final String content = args?['content'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}
