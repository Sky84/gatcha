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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby1.png",
				"adult": "res://Assets/Images/bebeble1.png"
			}
		},
		"bronze":{
			"species_name": "Bebeble",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby2.png",
				"adult": "res://Assets/Images/bebeble2.png"
			}
		},
		"silver":{
			"species_name": "Bebeble",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby3.png",
				"adult": "res://Assets/Images/bebeble3.png"
			}
		},
		"gold":{
			"species_name": "Bebeble",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/bebeble_baby3.png",
				"adult": "res://Assets/Images/bebeble3.png"
			}
		},
		"diamond":{
			"species_name": "Bebeble",
			"income_per_second": 150,
			"minutes_before_adult": 30,
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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby1.png",
				"adult": "res://Assets/Images/ploupy1.png"
			}
		},
		"bronze":{
			"species_name": "Ploupy",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby2.png",
				"adult": "res://Assets/Images/ploupy2.png"
			}
		},
		"silver":{
			"species_name": "Ploupy",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby3.png",
				"adult": "res://Assets/Images/ploupy3.png"
			}
		},
		"gold":{
			"species_name": "Ploupy",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/ploupy_baby3.png",
				"adult": "res://Assets/Images/ploupy3.png"
			}
		},
		"diamond":{
			"species_name": "Ploupy",
			"income_per_second": 150,
			"minutes_before_adult": 30,
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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby1.png",
				"adult": "res://Assets/Images/lezar1.png"
			}
		},
		"bronze":{
			"species_name": "Lee-zar",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby2.png",
				"adult": "res://Assets/Images/lezar2.png"
			}
		},
		"silver":{
			"species_name": "Lee-zar",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby3.png",
				"adult": "res://Assets/Images/lezar3.png"
			}
		},
		"gold":{
			"species_name": "Lee-zar",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/lezar_baby3.png",
				"adult": "res://Assets/Images/lezar3.png"
			}
		},
		"diamond":{
			"species_name": "Lee-zar",
			"income_per_second": 150,
			"minutes_before_adult": 30,
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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby1.png",
				"adult": "res://Assets/Images/bear1.png"
			}
		},
		"bronze":{
			"species_name": "Oursi",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby2.png",
				"adult": "res://Assets/Images/bear2.png"
			}
		},
		"silver":{
			"species_name": "Oursi",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby3.png",
				"adult": "res://Assets/Images/bear3.png"
			}
		},
		"gold":{
			"species_name": "Oursi",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/bear_baby3.png",
				"adult": "res://Assets/Images/bear3.png"
			}
		},
		"diamond":{
			"species_name": "Oursi",
			"income_per_second": 150,
			"minutes_before_adult": 30,
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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby1.png",
				"adult": "res://Assets/Images/cerf1.png"
			}
		},
		"bronze":{
			"species_name": "Cerfo",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby2.png",
				"adult": "res://Assets/Images/cerf2.png"
			}
		},
		"silver":{
			"species_name": "Cerfo",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby3.png",
				"adult": "res://Assets/Images/cerf3.png"
			}
		},
		"gold":{
			"species_name": "Cerfo",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/cerf_baby3.png",
				"adult": "res://Assets/Images/cerf3.png"
			}
		},
		"diamond":{
			"species_name": "Cerfo",
			"income_per_second": 150,
			"minutes_before_adult": 30,
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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby1.png",
				"adult": "res://Assets/Images/piaff1.png"
			}
		},
		"bronze":{
			"species_name": "Piaff",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby2.png",
				"adult": "res://Assets/Images/piaff2.png"
			}
		},
		"silver":{
			"species_name": "Piaff",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby3.png",
				"adult": "res://Assets/Images/piaff3.png"
			}
		},
		"gold":{
			"species_name": "Piaff",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/piaff_baby3.png",
				"adult": "res://Assets/Images/piaff3.png"
			}
		},
		"diamond":{
			"species_name": "Piaff",
			"income_per_second": 150,
			"minutes_before_adult": 30,
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
			"minutes_before_adult": 30,
			"selling_value": 1000,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby1.png",
				"adult": "res://Assets/Images/snakecartpillar1.png"
			}
		},
		"bronze":{
			"species_name": "Snaky",
			"income_per_second": 25,
			"minutes_before_adult": 30,
			"selling_value": 5000,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby2.png",
				"adult": "res://Assets/Images/snakecartpillar2.png"
			}
		},
		"silver":{
			"species_name": "Snaky",
			"income_per_second": 50,
			"minutes_before_adult": 30,
			"selling_value": 7500,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby3.png",
				"adult": "res://Assets/Images/snakecartpillar3.png"
			}
		},
		"gold":{
			"species_name": "Snaky",
			"income_per_second": 100,
			"minutes_before_adult": 30,
			"selling_value": 8500,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby3.png",
				"adult": "res://Assets/Images/snakecartpillar3.png"
			}
		},
		"diamond":{
			"species_name": "Snaky",
			"income_per_second": 150,
			"minutes_before_adult": 30,
			"selling_value": 10000,
			"visuals":{
				"baby": "res://Assets/Images/snakecartpillar_baby3.png",
				"adult": "res://Assets/Images/snakecartpillar3.png"
			}
		}
	},
}

func format_time(minutes: float) -> String:
	var hours = floor(minutes / 60);
	var minutes_remaining = fmod(minutes, 60);
	var seconds = floor(fmod(minutes * 60, 60));
	return str(hours).pad_zeros(2)+"h "+str(floor(minutes_remaining)).pad_zeros(2)+"m "+str(seconds).pad_zeros(2)+"s ";
