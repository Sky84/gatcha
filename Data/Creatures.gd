extends Node
class ICreature:
	var species_name: String;
	var visuals: Dictionary;
	var income_per_second: int;
	var selling_value: int;

var Creatures = {
	"bebeble": {
		"species_name": "Bebeble",
		"visuals": {
			"wood": {"baby": "res://Assets/Images/bebeble_baby.png", "adult": "res://Assets/Images/bebeble.png"},
			"bronze": {"baby": "res://Assets/Images/bebeble_baby2.png", "adult": "res://Assets/Images/bebeble2.png"},
			"silver": {"baby": "res://Assets/Images/bebeble_baby3.png", "adult": "res://Assets/Images/bebeble3.png"},
			"gold": {"baby": "res://Assets/Images/bebeble_baby3.png", "adult": "res://Assets/Images/bebeble3.png"},
			"diamond": {"baby": "res://Assets/Images/bebeble_baby3.png", "adult": "res://Assets/Images/bebeble3.png"},
		},
		"income_per_second": 2,
		"selling_value": 150
	},
	"ploupy": {
		"species_name": "Ploupy",
		"visuals": {
			"wood": {"baby": "res://Assets/Images/ploupy_baby.png", "adult": "res://Assets/Images/ploupy.png"},
			"bronze": {"baby": "res://Assets/Images/ploupy_baby2.png", "adult": "res://Assets/Images/ploupy2.png"},
			"silver": {"baby": "res://Assets/Images/ploupy_baby3.png", "adult": "res://Assets/Images/ploupy3.png"},
			"gold": {"baby": "res://Assets/Images/ploupy_baby3.png", "adult": "res://Assets/Images/ploupy3.png"},
			"diamond": {"baby": "res://Assets/Images/ploupy_baby3.png", "adult": "res://Assets/Images/ploupy3.png"},
		},
		"income_per_second": 5,
		"selling_value": 300
	}
}
