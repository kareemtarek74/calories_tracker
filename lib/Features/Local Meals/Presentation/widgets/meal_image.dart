import 'dart:io';

import 'package:flutter/material.dart';

class MealImage extends StatelessWidget {
  final String? imagePath;

  const MealImage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.isEmpty) {
      return const Icon(
        Icons.fastfood,
        size: 80,
        color: Colors.grey,
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.file(
          File(imagePath!),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 64, color: Colors.red),
        ),
      );
    }
  }
}
