import 'package:calories_tracker/Features/Presentation/screens/add_meal_screen.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SizedBox(
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
                    size: 32,
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
