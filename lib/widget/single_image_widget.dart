import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page/detail_page.dart';
import '../providers/clothing_provider.dart';

class SingleImageWidget extends StatelessWidget {
  const SingleImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final clothes = Provider.of<ClothingProvider>(context).clothes;

    if (clothes.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 260, // Adjust height as you like
      child: PageView.builder(
        itemCount: clothes.length,
        controller: PageController(viewportFraction: 0.9),
        itemBuilder: (context, index) {
          final item = clothes[index];
          return GestureDetector(
              onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => DetailPage(
                title: item.title,
                body: item.body,
                imageUrl: item.image,
              ),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported),
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          );
        },
      ),
    );
  }
}
