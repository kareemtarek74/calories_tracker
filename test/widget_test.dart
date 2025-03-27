import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/cubits/Meal%20Cubit/meal_cubit.dart';
import 'package:kareem_tarek/Features/Local%20Meals/Presentation/widgets/custom_meal_list_body.dart';
import 'package:kareem_tarek/core/widgets/custom_empty_widget.dart';
import 'package:kareem_tarek/injection_container.dart' as di;

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
