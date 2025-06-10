import 'package:flutter/material.dart';
import '../widget/clothes_list_widget.dart';
import '../widget/contact_info_widget.dart';
import '../widget/custom_drawer_widget.dart';
import '../widget/search_bar_widget.dart';
import '../widget/store_banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredClothes = clothes.where((item) {
      final title = item['title']!.toLowerCase();
      return title.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothing Store'),
      ),
      drawer: const CustomDrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Show search results only if there is a query
            if (searchQuery.isNotEmpty) ...[
              const Text(
                'Search Results:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SearchResultList(filteredClothes: filteredClothes),
              const SizedBox(height: 30),
            ],

            const StoreBannerWidget(),

            const SizedBox(height: 30),

            ClothingListWidget(searchQuery: ''),

            const SizedBox(height: 30),

            const ContactInfoWidget(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
