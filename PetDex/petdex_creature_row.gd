extends Control

const PETDEX_CREATURE_ITEM = preload("res://PetDex/petdex_creature_item.tscn");
@onready var grid_container = $GridContainer;
@onready var label = $Label;

func init_row(creature):
	# We know there is only the types in keys
	var types = creature.keys();
	creature.age = "adult";
	for type in types:
		creature.type = type;
		var instance = PETDEX_CREATURE_ITEM.instantiate();
		var creature_seen = Player.have_already_seen_creature(creature);
		grid_container.add_child(instance);
		if creature_seen:
			label.text = creature[creature.type].species_name;
		instance.init_item(creature, creature_seen);
