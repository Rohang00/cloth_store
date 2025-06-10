import 'package:flutter/material.dart';

class StoreBannerWidget extends StatelessWidget {
  const StoreBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to Our Store!',
        style: TextStyle(
          color: Colors.red, // You can keep the color red or change it
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
