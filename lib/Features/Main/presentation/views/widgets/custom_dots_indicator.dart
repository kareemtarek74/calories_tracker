import 'package:calories_tracker/Features/Main/presentation/views/widgets/custom_dot.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator(
      {super.key, required this.pageNum, required this.pagesCount});
  final int pageNum, pagesCount;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            pagesCount,
            (index) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: CustomDot(
                    isActive: pageNum == index,
                  ),
                )));
  }
}
