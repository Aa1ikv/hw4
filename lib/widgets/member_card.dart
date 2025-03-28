import 'package:flutter/material.dart';

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
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
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