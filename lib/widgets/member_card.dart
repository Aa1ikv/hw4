import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String imageUrl;

  const MemberCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name),
          ),
        ],
      ),
    );
  }
}