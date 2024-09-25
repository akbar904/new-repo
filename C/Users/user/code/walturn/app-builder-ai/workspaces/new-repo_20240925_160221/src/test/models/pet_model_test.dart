
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_switcher/models/pet_model.dart';

void main() {
	group('Pet Model', () {
		test('should create a Pet instance with given name and icon', () {
			const petName = 'Cat';
			const petIcon = Icons.pets;

			final pet = Pet(name: petName, icon: petIcon);

			expect(pet.name, petName);
			expect(pet.icon, petIcon);
		});

		test('should serialize and deserialize correctly', () {
			const petName = 'Dog';
			const petIcon = Icons.person;

			final pet = Pet(name: petName, icon: petIcon);

			final serialized = pet.toJson();
			final deserialized = Pet.fromJson(serialized);

			expect(deserialized.name, pet.name);
			expect(deserialized.icon, pet.icon);
		});
	});
}
