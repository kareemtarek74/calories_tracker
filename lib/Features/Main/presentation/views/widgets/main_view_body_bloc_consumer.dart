import 'package:flutter/material.dart';
import 'package:kareem_tarek/Features/Main/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return MainViewBody(currentViewIndex: currentViewIndex);
  }
}
