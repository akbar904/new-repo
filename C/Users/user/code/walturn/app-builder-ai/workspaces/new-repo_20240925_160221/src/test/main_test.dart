
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:pet_switcher/main.dart';

class MockPetCubit extends MockCubit<Pet> implements PetCubit {}

void main() {
	group('MyApp', () {
		testWidgets('displays HomeScreen widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('main', () {
		test('main initializes the app without exceptions', () {
			expect(() => main(), returnsNormally);
		});
	});
}
