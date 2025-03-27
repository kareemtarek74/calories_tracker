import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MealDetailsShimmer extends StatelessWidget {
  const MealDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 200, width: double.infinity, color: Colors.white),
            const SizedBox(height: 16),
            Container(height: 24, width: 200, color: Colors.white),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(height: 32, width: 80, color: Colors.white),
                const SizedBox(width: 8),
                Container(height: 32, width: 80, color: Colors.white),
              ],
            ),
            const SizedBox(height: 24),
            Container(height: 20, width: 120, color: Colors.white),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                6,
                (index) => Container(
                  height: 32,
                  width: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(height: 20, width: 140, color: Colors.white),
            const SizedBox(height: 8),
            Container(height: 300, width: double.infinity, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
