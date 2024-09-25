
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_switcher/widgets/pet_display.dart';

class MockPet extends Mock implements Pet {}

void main() {
	group('PetDisplay Widget Tests', () {
		testWidgets('should display cat with clock icon', (WidgetTester tester) async {
			// Arrange
			const pet = Pet(name: 'Cat', icon: Icons.access_time);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetDisplay(pet: pet),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('should display dog with person icon', (WidgetTester tester) async {
			// Arrange
			const pet = Pet(name: 'Dog', icon: Icons.person);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: PetDisplay(pet: pet),
					),
				),
			);

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
