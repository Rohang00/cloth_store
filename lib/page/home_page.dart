import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/clothing_provider.dart';
import '../widget/new_list_widget.dart';
import '../widget/contact_info_widget.dart';
import '../widget/custom_drawer_widget.dart';
import '../widget/search_bar_widget.dart';
import '../widget/single_image_widget.dart';
import '../widget/store_banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Fetch clothes when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ClothingProvider>(context, listen: false).fetchClothes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothing Store'),
        backgroundColor: Colors.blue[100],
      ),
      drawer: const CustomDrawerWidget(),
      body: Consumer<ClothingProvider>(
        builder: (context, clothingProvider, child) {
          if (clothingProvider.isLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading clothes...'),
                ],
              ),
            );
          }

          if (clothingProvider.error.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${clothingProvider.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => clothingProvider.fetchClothes(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                SearchBarWidget(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),

                // Store Banner
                const StoreBannerWidget(),
                const SingleImageWidget(),
                const SizedBox(height: 30),

                // Main Clothing Collection (always shown)
                const NewListWidget(),
                const SizedBox(height: 30),

                // Contact Info
                const ContactInfoWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}