import 'package:calories_tracker/core/text_styles.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final void Function(String) onFilterSelected;

  const FilterBottomSheet({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Sort Meals By', style: Styles.styleBold24(context)),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.access_time, color: Colors.blue),
            title: const Text('Time'),
            onTap: () => applyFilter(context, 'time'),
          ),
          ListTile(
            leading: const Icon(Icons.sort_by_alpha, color: Colors.green),
            title: const Text('Name'),
            onTap: () => applyFilter(context, 'name'),
          ),
          ListTile(
            leading: const Icon(Icons.local_fire_department, color: Colors.red),
            title: const Text('Calories'),
            onTap: () => applyFilter(context, 'calories'),
          ),
        ],
      ),
    );
  }

  void applyFilter(BuildContext context, String filter) {
    onFilterSelected(filter);
    Navigator.pop(context);
  }
}
