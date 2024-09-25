
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:pet_switcher/cubits/pet_cubit.dart';
import 'package:pet_switcher/models/pet_model.dart';

// A mock class for PetCubit, if needed, can be created using mocktail.
class MockPetCubit extends MockCubit<Pet> implements PetCubit {}

void main() {
	group('PetCubit', () {
		late PetCubit petCubit;

		setUp(() {
			petCubit = PetCubit();
		});

		tearDown(() {
			petCubit.close();
		});

		test('initial state is Cat', () {
			expect(petCubit.state.name, 'Cat');
			expect(petCubit.state.icon, Icons.pets);
		});

		blocTest<PetCubit, Pet>(
			'emits Dog when switchPet is called after being Cat',
			build: () => petCubit,
			act: (cubit) => cubit.switchPet(),
			expect: () => [Pet(name: 'Dog', icon: Icons.person)],
		);

		blocTest<PetCubit, Pet>(
			'emits Cat when switchPet is called after being Dog',
			build: () {
				petCubit.emit(Pet(name: 'Dog', icon: Icons.person));
				return petCubit;
			},
			act: (cubit) => cubit.switchPet(),
			expect: () => [Pet(name: 'Cat', icon: Icons.pets)],
		);
	});
}
