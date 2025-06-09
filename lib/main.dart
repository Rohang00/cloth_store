import 'package:cloth_store/page/detail_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
List<Map<String, String>> clothes = [
  {
    'title': 'T-shirt',
    'image': 'https://picsum.photos/200?random=1',
  },
  {
    'title': 'Pants',
    'image': 'https://picsum.photos/200?random=2',
  },
  {
    'title': 'Jacket',
    'image': 'https://picsum.photos/200?random=3',
  },
  {
    'title': 'Sweater',
    'image': 'https://picsum.photos/200?random=4',
  },
  {
    'title': 'Hoodie',
    'image': 'https://picsum.photos/200?random=5',
  },
  {
    'title': 'Jeans',
    'image': 'https://picsum.photos/200?random=6',
  },
  {
    'title': 'Blazer',
    'image': 'https://picsum.photos/200?random=7',
  },
  {
    'title': 'Skirt',
    'image': 'https://picsum.photos/200?random=8',
  },
  {
    'title': 'Dress Shirt',
    'image': 'https://picsum.photos/200?random=9',
  },
  {
    'title': 'Shorts',
    'image': 'https://picsum.photos/200?random=10',
  },
  {
    'title': 'Coat',
    'image': 'https://picsum.photos/200?random=11',
  },
  {
    'title': 'Cardigan',
    'image': 'https://picsum.photos/200?random=12',
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
                 MaterialPageRoute(builder: (context)=>DetailPage(title: 'T-shirt', imageUrl: 'https://picsum.photos/200?random=1'))
               );
           }
           ),
          );
        },
      ),
    );
  }
}

