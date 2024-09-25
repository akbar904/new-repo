
import 'package:flutter/material.dart';

class Pet {
	final String name;
	final IconData icon;

	Pet({
		required this.name,
		required this.icon,
	});

	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'icon': icon.codePoint,
		};
	}

	factory Pet.fromJson(Map<String, dynamic> json) {
		return Pet(
			name: json['name'],
			icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
