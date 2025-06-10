import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../page/detail_page.dart';
import '../providers/clothing_provider.dart';

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ClothingProvider>(context);
    final searchResults = provider.searchClothes(_searchQuery);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: 'Search clothes...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
            widget.onChanged(value);
          },
        ),
        const SizedBox(height: 10),
        if (_searchQuery.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final item = searchResults[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(item.title),
                subtitle: Text(
                  item.body.length > 50
                      ? '${item.body.substring(0, 50)}...'
                      : item.body,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(
                        title: item.title,
                        body: item.body,
                        imageUrl: item.image,
                      ),
                    ),
                  );
                },
              );
            },
          ),
      ],
    );
  }
}
