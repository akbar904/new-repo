
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_switcher/screens/home_screen.dart';

class MockPetCubit extends MockCubit<int> implements PetCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays initial pet as Cat with clock icon', (WidgetTester tester) async {
			final mockPetCubit = MockPetCubit();
			when(() => mockPetCubit.state).thenReturn(0); // Assuming 0 is for Cat

			await tester.pumpWidget(
				BlocProvider<PetCubit>.value(
					value: mockPetCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog with person icon after tap', (WidgetTester tester) async {
			final mockPetCubit = MockPetCubit();
			whenListen(
				mockPetCubit,
				Stream.fromIterable([0, 1]), // 0 for Cat, 1 for Dog
				initialState: 0,
			);

			await tester.pumpWidget(
				BlocProvider<PetCubit>.value(
					value: mockPetCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
