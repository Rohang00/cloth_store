import 'package:cloth_store/page/detail_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
List<Map<String, dynamic>> clothes = [
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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clothing store',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text ('Clothing Home'),),
      body: ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index){
          final item = clothes [index];
          return Card(
           margin: const EdgeInsets.all(8),
           child: ListTile(
             leading: SizedBox(
               width: 50,
               height: 50,
               child:Image.network(
                 item['image']!,
                 fit: BoxFit.cover,
               ),
             ),
             title: Text(item['title']!),
             onTap:(){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context)=>DetailPage(
                   title: item['title']!,
                   imageUrl: item['image']!,
                   price: item['price']!,
                   label: item['label']!,
                   madeIn: item['madeIn']!,
                   description: item['description']!,
                 ))
               );
           }
           ),
          );
        },
      ),
    );
  }
}

