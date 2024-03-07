extends Node
class ICreature:
	var species_name: String;
	var visuals: Dictionary;
	var income_per_second: int;
	var selling_value: int;

const MAX_CREATURES = 25;

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
	},
	"lezar": {
		"species_name": "Lee-zar",
		"visuals": {
			"wood": {"baby": "res://Assets/Images/lezar_baby1.png", "adult": "res://Assets/Images/lezar1.png"},
			"bronze": {"baby": "res://Assets/Images/lezar_baby2.png", "adult": "res://Assets/Images/lezar2.png"},
			"silver": {"baby": "res://Assets/Images/lezar_baby3.png", "adult": "res://Assets/Images/lezar3.png"},
			"gold": {"baby": "res://Assets/Images/lezar_baby3.png", "adult": "res://Assets/Images/lezar3.png"},
			"diamond": {"baby": "res://Assets/Images/lezar_baby3.png", "adult": "res://Assets/Images/lezar3.png"},
		},
		"income_per_second": 5,
		"selling_value": 300
	},
	"bear": {
		"species_name": "Ours",
		"visuals": {
			"wood": {"baby": "res://Assets/Images/bear_baby1.png", "adult": "res://Assets/Images/bear1.png"},
			"bronze": {"baby": "res://Assets/Images/bear_baby2.png", "adult": "res://Assets/Images/bear2.png"},
			"silver": {"baby": "res://Assets/Images/bear_baby3.png", "adult": "res://Assets/Images/bear3.png"},
			"gold": {"baby": "res://Assets/Images/bear_baby3.png", "adult": "res://Assets/Images/bear3.png"},
			"diamond": {"baby": "res://Assets/Images/bear_baby3.png", "adult": "res://Assets/Images/bear3.png"},
		},
		"income_per_second": 5,
		"selling_value": 300
	},
	"cerf": {
		"species_name": "Cerf",
		"visuals": {
			"wood": {"baby": "res://Assets/Images/cerf_baby1.png", "adult": "res://Assets/Images/cerf1.png"},
			"bronze": {"baby": "res://Assets/Images/cerf_baby2.png", "adult": "res://Assets/Images/cerf2.png"},
			"silver": {"baby": "res://Assets/Images/cerf_baby3.png", "adult": "res://Assets/Images/cerf3.png"},
			"gold": {"baby": "res://Assets/Images/cerf_baby3.png", "adult": "res://Assets/Images/cerf3.png"},
			"diamond": {"baby": "res://Assets/Images/cerf_baby3.png", "adult": "res://Assets/Images/cerf3.png"},
		},
		"income_per_second": 5,
		"selling_value": 300
	}
}

func get_creature_id(creature_data):
	return creature_data.type+"_"+creature_data.species_name;
