import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String body;
  final String imageUrl;

  const DetailPage({
    super.key,
    required this.title,
    required this.body,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(imageUrl),
            const SizedBox(height: 20),
            Text(body, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
