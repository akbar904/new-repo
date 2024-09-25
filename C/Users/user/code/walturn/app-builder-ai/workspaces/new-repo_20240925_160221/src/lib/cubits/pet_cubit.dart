
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pet_switcher/models/pet_model.dart';

class PetCubit extends Cubit<Pet> {
	PetCubit() : super(const Pet(name: 'Cat', icon: Icons.pets));

	void switchPet() {
		if (state.name == 'Cat') {
			emit(const Pet(name: 'Dog', icon: Icons.person));
		} else {
			emit(const Pet(name: 'Cat', icon: Icons.pets));
		}
	}
}
