
import 'package:flutter/material.dart';
import 'package:pet_switcher/models/pet_model.dart';

class PetDisplay extends StatelessWidget {
	final Pet pet;

	const PetDisplay({Key? key, required this.pet}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			children: [
				Text(pet.name),
				Icon(pet.icon),
			],
		);
	}
}
