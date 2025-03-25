import 'package:calories_tracker/Features/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:calories_tracker/Features/Presentation/widgets/custom_meal_list_body.dart';
import 'package:calories_tracker/core/widgets/custom_empty_widget.dart';
import 'package:calories_tracker/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    di.init();
  });

  testWidgets('Displays empty widget when there are no meals',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => di.sl<MealCubit>()..emit(MealLoaded([], 0)),
          child: CustomMealListBody(filter: 'name'),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(CustomEmptyWidget), findsOneWidget);
  });
}
