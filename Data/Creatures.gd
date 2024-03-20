extends Node
class ICreature:
	var species_name: String;
	var visuals: Dictionary;
	var income_per_second: int;
	var selling_value: int;

const MAX_CREATURES = 25;

var Creatures = {
	"bebeble": {
		"wood":{
			"species_name": "Bebeble",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby1.png",
				"adult": "res://Assets/Images/bebeble1.png"
			}
		},
		"bronze":{
			"species_name": "Bebeble",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby2.png",
				"adult": "res://Assets/Images/bebeble2.png"
			}
		},
		"silver":{
			"species_name": "Bebeble",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby3.png",
				"adult": "res://Assets/Images/bebeble3.png"
			}
		},
		"gold":{
			"species_name": "Bebeble",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby3.png",
				"adult": "res://Assets/Images/bebeble3.png"
			}
		},
		"diamond":{
			"species_name": "Bebeble",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby3.png",
				"adult": "res://Assets/Images/bebeble3.png"
			}
		}
	},
	"ploupy": {
		"wood":{
			"species_name": "Ploupy",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby1.png",
				"adult": "res://Assets/Images/ploupy1.png"
			}
		},
		"bronze":{
			"species_name": "Ploupy",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby2.png",
				"adult": "res://Assets/Images/ploupy2.png"
			}
		},
		"silver":{
			"species_name": "Ploupy",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby3.png",
				"adult": "res://Assets/Images/ploupy3.png"
			}
		},
		"gold":{
			"species_name": "Ploupy",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby3.png",
				"adult": "res://Assets/Images/ploupy3.png"
			}
		},
		"diamond":{
			"species_name": "Ploupy",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby3.png",
				"adult": "res://Assets/Images/ploupy3.png"
			}
		}
	},
	"lezar": {
		"wood":{
			"species_name": "Lee-zar",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby1.png",
				"adult": "res://Assets/Images/lezar1.png"
			}
		},
		"bronze":{
			"species_name": "Lee-zar",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby2.png",
				"adult": "res://Assets/Images/lezar2.png"
			}
		},
		"silver":{
			"species_name": "Lee-zar",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby3.png",
				"adult": "res://Assets/Images/lezar3.png"
			}
		},
		"gold":{
			"species_name": "Lee-zar",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby3.png",
				"adult": "res://Assets/Images/lezar3.png"
			}
		},
		"diamond":{
			"species_name": "Lee-zar",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby3.png",
				"adult": "res://Assets/Images/lezar3.png"
			}
		}
	},
	"bear": {
		"wood":{
			"species_name": "Oursi",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby1.png",
				"adult": "res://Assets/Images/bear1.png"
			}
		},
		"bronze":{
			"species_name": "Oursi",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby2.png",
				"adult": "res://Assets/Images/bear2.png"
			}
		},
		"silver":{
			"species_name": "Oursi",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby3.png",
				"adult": "res://Assets/Images/bear3.png"
			}
		},
		"gold":{
			"species_name": "Oursi",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby3.png",
				"adult": "res://Assets/Images/bear3.png"
			}
		},
		"diamond":{
			"species_name": "Oursi",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby3.png",
				"adult": "res://Assets/Images/bear3.png"
			}
		}
	},
	"cerf": {
		"wood":{
			"species_name": "Cerfo",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby1.png",
				"adult": "res://Assets/Images/cerf1.png"
			}
		},
		"bronze":{
			"species_name": "Cerfo",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby2.png",
				"adult": "res://Assets/Images/cerf2.png"
			}
		},
		"silver":{
			"species_name": "Cerfo",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby3.png",
				"adult": "res://Assets/Images/cerf3.png"
			}
		},
		"gold":{
			"species_name": "Cerfo",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby3.png",
				"adult": "res://Assets/Images/cerf3.png"
			}
		},
		"diamond":{
			"species_name": "Cerfo",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby3.png",
				"adult": "res://Assets/Images/cerf3.png"
			}
		}
	},
	"piaff": {
		"wood":{
			"species_name": "Piaff",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby1.png",
				"adult": "res://Assets/Images/piaff1.png"
			}
		},
		"bronze":{
			"species_name": "Piaff",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby2.png",
				"adult": "res://Assets/Images/piaff2.png"
			}
		},
		"silver":{
			"species_name": "Piaff",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby3.png",
				"adult": "res://Assets/Images/piaff3.png"
			}
		},
		"gold":{
			"species_name": "Piaff",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby3.png",
				"adult": "res://Assets/Images/piaff3.png"
			}
		},
		"diamond":{
			"species_name": "Piaff",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby3.png",
				"adult": "res://Assets/Images/piaff3.png"
			}
		}
	},
	"snakecartpillar": {
		"wood":{
			"species_name": "Snaky",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby1.png",
				"adult": "res://Assets/Images/snakecartpillar1.png"
			}
		},
		"bronze":{
			"species_name": "Snaky",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby2.png",
				"adult": "res://Assets/Images/snakecartpillar2.png"
			}
		},
		"silver":{
			"species_name": "Snaky",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby3.png",
				"adult": "res://Assets/Images/snakecartpillar3.png"
			}
		},
		"gold":{
			"species_name": "Snaky",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby3.png",
				"adult": "res://Assets/Images/snakecartpillar3.png"
			}
		},
		"diamond":{
			"species_name": "Snaky",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby3.png",
				"adult": "res://Assets/Images/snakecartpillar3.png"
			}
		}
	},
	"dog": {
		"wood":{
			"species_name": "Doggo",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/dog_baby1.png",
				"adult": "res://Assets/Images/dog1.png"
			}
		},
		"bronze":{
			"species_name": "Doggo",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/dog_baby2.png",
				"adult": "res://Assets/Images/dog2.png"
			}
		},
		"silver":{
			"species_name": "Doggo",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/dog_baby3.png",
				"adult": "res://Assets/Images/dog3.png"
			}
		},
		"gold":{
			"species_name": "Doggo",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/dog_baby4.png",
				"adult": "res://Assets/Images/dog4.png"
			}
		},
		"diamond":{
			"species_name": "Doggo",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/dog_baby5.png",
				"adult": "res://Assets/Images/dog5.png"
			}
		}
	},
	"souris": {
		"wood":{
			"species_name": "Pipsqueak",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/souris_baby1.png",
				"adult": "res://Assets/Images/souris1.png"
			}
		},
		"bronze":{
			"species_name": "Pipsqueak",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/souris_baby2.png",
				"adult": "res://Assets/Images/souris2.png"
			}
		},
		"silver":{
			"species_name": "Pipsqueak",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/souris_baby3.png",
				"adult": "res://Assets/Images/souris3.png"
			}
		},
		"gold":{
			"species_name": "Pipsqueak",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/souris_baby4.png",
				"adult": "res://Assets/Images/souris4.png"
			}
		},
		"diamond":{
			"species_name": "Pipsqueak",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/souris_baby5.png",
				"adult": "res://Assets/Images/souris5.png"
			}
		}
	},
	"owl": {
		"wood":{
			"species_name": "Noctowl",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/owl_baby1.png",
				"adult": "res://Assets/Images/owl1.png"
			}
		},
		"bronze":{
			"species_name": "Noctowl",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/owl_baby2.png",
				"adult": "res://Assets/Images/owl2.png"
			}
		},
		"silver":{
			"species_name": "Noctowl",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/owl_baby3.png",
				"adult": "res://Assets/Images/owl3.png"
			}
		},
		"gold":{
			"species_name": "Noctowl",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/owl_baby4.png",
				"adult": "res://Assets/Images/owl4.png"
			}
		},
		"diamond":{
			"species_name": "Noctowl",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/owl_baby5.png",
				"adult": "res://Assets/Images/owl5.png"
			}
		}
	},
	"gorille": {
		"wood":{
			"species_name": "Brutesmash",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/gorille_baby1.png",
				"adult": "res://Assets/Images/gorille1.png"
			}
		},
		"bronze":{
			"species_name": "Brutesmash",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/gorille_baby2.png",
				"adult": "res://Assets/Images/gorille2.png"
			}
		},
		"silver":{
			"species_name": "Brutesmash",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/gorille_baby3.png",
				"adult": "res://Assets/Images/gorille3.png"
			}
		},
		"gold":{
			"species_name": "Brutesmash",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/gorille_baby4.png",
				"adult": "res://Assets/Images/gorille4.png"
			}
		},
		"diamond":{
			"species_name": "Brutesmash",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/gorille_baby5.png",
				"adult": "res://Assets/Images/gorille5.png"
			}
		}
	},
	"autruche": {
		"wood":{
			"species_name": "Featherun",
			"income_per_second": 5,
			"minutes_before_adult": 5,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/autruche_baby1.png",
				"adult": "res://Assets/Images/autruche1.png"
			}
		},
		"bronze":{
			"species_name": "Featherun",
			"income_per_second": 25,
			"minutes_before_adult": 20,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/autruche_baby2.png",
				"adult": "res://Assets/Images/autruche2.png"
			}
		},
		"silver":{
			"species_name": "Featherun",
			"income_per_second": 50,
			"minutes_before_adult": 40,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/autruche_baby3.png",
				"adult": "res://Assets/Images/autruche3.png"
			}
		},
		"gold":{
			"species_name": "Featherun",
			"income_per_second": 100,
			"minutes_before_adult": 50,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/autruche_baby4.png",
				"adult": "res://Assets/Images/autruche4.png"
			}
		},
		"diamond":{
			"species_name": "Featherun",
			"income_per_second": 150,
			"minutes_before_adult": 70,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/autruche_baby5.png",
				"adult": "res://Assets/Images/autruche5.png"
			}
		}
	},
}

func format_time(minutes: float) -> String:
	var hours = floor(minutes / 60);
	var minutes_remaining = fmod(minutes, 60);
	var seconds = floor(fmod(minutes * 60, 60));
	return str(hours).pad_zeros(2)+"h "+str(floor(minutes_remaining)).pad_zeros(2)+"m "+str(seconds).pad_zeros(2)+"s ";
