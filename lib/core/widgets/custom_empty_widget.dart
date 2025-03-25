import 'package:calories_tracker/core/text_styles.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CustomEmptyWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple.withOpacity(0.1),
            ),
            child: Icon(
              icon,
              size: 60,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Styles.styleBold16(context).copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: Styles.styleRegular14(context).copyWith(
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
