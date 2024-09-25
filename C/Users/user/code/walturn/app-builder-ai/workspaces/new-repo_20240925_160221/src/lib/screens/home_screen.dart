
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_switcher/cubits/pet_cubit.dart';
import 'package:pet_switcher/widgets/pet_display.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Pet Switcher'),
			),
			body: Center(
				child: BlocBuilder<PetCubit, int>(
					builder: (context, state) {
						final pet = state == 0
							? Pet(name: 'Cat', icon: Icons.access_time)
							: Pet(name: 'Dog', icon: Icons.person);
						return GestureDetector(
							onTap: () => context.read<PetCubit>().switchPet(),
							child: PetDisplay(pet: pet),
						);
					},
				),
			),
		);
	}
}
