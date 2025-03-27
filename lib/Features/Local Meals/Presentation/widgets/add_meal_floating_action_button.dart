import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/screens/add_meal_screen.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddMealScreen.routeName,
          );
        },
        backgroundColor: const Color(0xFF5F33E1),
        heroTag: 'addTaskButton',
        elevation: 10,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
