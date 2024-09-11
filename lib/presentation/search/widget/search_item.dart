import 'package:flutter/material.dart';
import 'package:search_map_nws/domain/entities/location_model.dart';
import 'package:search_map_nws/global/extentions/highlight_occurrences.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.data, required this.onTap, required this.query});

  final ItemsModel data;
  final String query;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.black87,
                size: 20,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    RichText(
                      text: TextSpan(
                        children: highlightOccurrences(
                          source: data.title!,
                          query: query,
                          normalStyle: const TextStyle(color: Colors.black),
                          highLightStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTap,
                icon: const Icon(
                  Icons.directions,
                  color: Colors.black87,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
