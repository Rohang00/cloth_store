import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ClothingItem {
  final int id;
  final String title;
  final String body;
  final String image;

  ClothingItem({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
  });
}

class ClothingProvider with ChangeNotifier {
  List<ClothingItem> _clothes = [];
  bool _isLoading = false;
  String _error = '';

  List<ClothingItem> get clothes => _clothes;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchClothes() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final postsResponse = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts')
      );

      if (postsResponse.statusCode != 200) {
        _error = 'Failed to load posts';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final List<dynamic> postsData = json.decode(postsResponse.body);

      final imagesResponse = await http.get(
          Uri.parse('https://picsum.photos/v2/list?limit=${postsData.length}')
      );

      if (imagesResponse.statusCode != 200) {
        _error = 'Failed to load images';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final List<dynamic> imagesData = json.decode(imagesResponse.body);

      // Combining image with post with id
      _clothes = [];
      for (int i = 0; i < postsData.length; i++) {
        String imageUrl = '';

        if (i < imagesData.length && imagesData[i]['download_url'] != null) {
          imageUrl = imagesData[i]['download_url'];
        }

        _clothes.add(ClothingItem(
          id: postsData[i]['id'],
          title: postsData[i]['title'],
          body: postsData[i]['body'],
          image: imageUrl,
        ));
      }

    } catch (e) {
      _error = 'Network error: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  List<ClothingItem> searchClothes(String query) {
    if (query.isEmpty) return _clothes;
    return _clothes.where((item) =>
        item.title.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
}