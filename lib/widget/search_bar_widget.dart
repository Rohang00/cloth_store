import 'package:flutter/material.dart';
import '../page/detail_page.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search clothes by title',
        border: OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}

class SearchResultList extends StatelessWidget {
  final List<Map<String, dynamic>> filteredClothes;

  const SearchResultList({super.key, required this.filteredClothes});

  @override
  Widget build(BuildContext context) {
    if (filteredClothes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text('No clothes found.'),
      );
    }

    return Column(
      children: filteredClothes.map((item) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Image.network(
              item['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item['title']),
            subtitle: Text('Made in: ${item['madeIn']} - \$${item['price']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailPage(
                    title: item['title'],
                    imageUrl: item['image'],
                    price: item['price'],
                    label: item['label'],
                    madeIn: item['madeIn'],
                    description: item['description'],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
