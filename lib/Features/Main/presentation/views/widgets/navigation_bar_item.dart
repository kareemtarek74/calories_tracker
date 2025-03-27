import 'package:calories_tracker/Features/Main/Domain/Entities/buttom_vavigation_bar_entity.dart';
import 'package:flutter/material.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.item,
  });

  final bool isSelected;
  final BottomNavigationBarEntity item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isSelected ? item.activeIcon : item.icon,
          color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          item.label,
          style: TextStyle(
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
