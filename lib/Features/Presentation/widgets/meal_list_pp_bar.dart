import 'package:calories_tracker/Features/Presentation/widgets/filter_bottom_sheet.dart';
import 'package:calories_tracker/core/text_styles.dart';
import 'package:flutter/material.dart';

class MealListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(String) onFilterSelected;

  const MealListAppBar({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const Icon(Icons.local_fire_department,
              color: Color(0xFFEF6C00), size: 28),
          const SizedBox(width: 8),
          Text(
            'Calories Tracker',
            style: Styles.styleBold24(context).copyWith(color: Colors.black),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined,
              color: Color(0xff24252C), size: 28),
          onPressed: () => showFilterBottomSheet(context),
        ),
      ],
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FilterBottomSheet(onFilterSelected: onFilterSelected);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
