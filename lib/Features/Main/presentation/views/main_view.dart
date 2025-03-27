import 'package:calories_tracker/Features/Main/presentation/views/widgets/custom_navigation_bar.dart';
import 'package:calories_tracker/Features/Main/presentation/views/widgets/main_view_body_bloc_consumer.dart';
import 'package:calories_tracker/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/buttom_navigation_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationCubit>(
      create: (context) => di.sl<BottomNavigationCubit>(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<BottomNavigationCubit, SelectedTab>(
          builder: (context, currentTab) {
            return CustomBottomNavigationBar(
              onItemTapped: (index) {
                context.read<BottomNavigationCubit>().setTab(index);
              },
              selectedIndex: SelectedTab.values.indexOf(currentTab),
            );
          },
        ),
        body: SafeArea(
          child: BlocBuilder<BottomNavigationCubit, SelectedTab>(
            builder: (context, currentTab) {
              return MainViewBodyBlocConsumer(
                currentViewIndex: SelectedTab.values.indexOf(currentTab),
              );
            },
          ),
        ),
      ),
    );
  }
}
