import 'package:flutter/material.dart';
import '../page/detail_page.dart';

final List<Map<String, dynamic>> clothes = [
  {
    'title': 'T-shirt',
    'image': 'https://picsum.photos/200?random=1',
    'price': 19.99,
    'label': 'Casual',
    'madeIn': 'Kathmandu',
    'description': 'A comfortable cotton T-shirt perfect for everyday wear.',
  },
  {
    'title': 'Pants',
    'image': 'https://picsum.photos/200?random=2',
    'price': 39.99,
    'label': 'Formal',
    'madeIn': 'Pokhara',
    'description': 'Elegant pants suitable for office or formal occasions.',
  },
  {
    'title': 'Jacket',
    'image': 'https://picsum.photos/200?random=3',
    'price': 59.99,
    'label': 'Outerwear',
    'madeIn': 'Janakpur',
    'description': 'Warm jacket for cold weather with stylish design.',
  },
  {
    'title': 'Sweater',
    'image': 'https://picsum.photos/200?random=4',
    'price': 29.99,
    'label': 'Casual',
    'madeIn': 'Birjung',
    'description': 'Soft sweater made from premium wool.',
  },
  {
    'title': 'Hoodie',
    'image': 'https://picsum.photos/200?random=5',
    'price': 34.99,
    'label': 'Sportswear',
    'madeIn': 'Dharan',
    'description': 'Comfortable hoodie with a modern fit.',
  },
  {
    'title': 'Jeans',
    'image': 'https://picsum.photos/200?random=6',
    'price': 49.99,
    'label': 'Denim',
    'madeIn': 'Biratnagar',
    'description': 'Classic blue jeans with durable fabric.',
  },
  {
    'title': 'Blazer',
    'image': 'https://picsum.photos/200?random=7',
    'price': 79.99,
    'label': 'Formal',
    'madeIn': 'Butwal',
    'description': 'Sharp blazer for professional and casual wear.',
  },
  {
    'title': 'Skirt',
    'image': 'https://picsum.photos/200?random=8',
    'price': 24.99,
    'label': 'Casual',
    'madeIn': 'Hetauda',
    'description': 'Stylish skirt made with light fabric.',
  },
  {
    'title': 'Dress Shirt',
    'image': 'https://picsum.photos/200?random=9',
    'price': 44.99,
    'label': 'Formal',
    'madeIn': 'Lalitpur',
    'description': 'Crisp dress shirt for formal occasions.',
  },
  {
    'title': 'Shorts',
    'image': 'https://picsum.photos/200?random=10',
    'price': 19.99,
    'label': 'Casual',
    'madeIn': 'Dhangadhi',
    'description': 'Comfortable shorts for summer wear.',
  },
  {
    'title': 'Coat',
    'image': 'https://picsum.photos/200?random=11',
    'price': 99.99,
    'label': 'Outerwear',
    'madeIn': 'Nepalgunj',
    'description': 'Heavy coat designed for harsh winter.',
  },
  {
    'title': 'Cardigan',
    'image': 'https://picsum.photos/200?random=12',
    'price': 39.99,
    'label': 'Casual',
    'madeIn': 'Janakpur',
    'description': 'Soft cardigan for layering and comfort.',
  },
];

class ClothingListWidget extends StatelessWidget {
  final String searchQuery;

  const ClothingListWidget({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final filteredClothes = clothes.where((item) {
      final title = item['title']!.toLowerCase();
      return title.contains(searchQuery.toLowerCase());
    }).toList();

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredClothes.length,
        itemBuilder: (context, index) {
          final item = filteredClothes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: item['title']!,
                    imageUrl: item['image']!,
                    price: item['price']!,
                    label: item['label']!,
                    madeIn: item['madeIn']!,
                    description: item['description']!,
                  ),
                ),
              );
            },
            child: Container(
              width: 150,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      item['image']!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    '\$${item['price']!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
