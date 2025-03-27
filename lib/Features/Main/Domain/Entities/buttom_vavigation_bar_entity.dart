import 'package:flutter/material.dart';

class BottomNavigationBarEntity {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  BottomNavigationBarEntity({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        label: 'Home',
      ),
      BottomNavigationBarEntity(
        icon: Icons.search_outlined,
        activeIcon: Icons.search,
        label: 'Search',
      ),
      BottomNavigationBarEntity(
        icon: Icons.category_outlined,
        activeIcon: Icons.category,
        label: 'Categories',
      ),
    ];
