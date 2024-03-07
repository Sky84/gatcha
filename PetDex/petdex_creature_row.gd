extends Control

const PETDEX_CREATURE_ITEM = preload("res://PetDex/petdex_creature_item.tscn");
@onready var grid_container = $GridContainer;
@onready var label = $Label;

func init_row(creature):
	creature.age = "adult";
	for type in creature.visuals:
		creature.type = type;
		var instance = PETDEX_CREATURE_ITEM.instantiate();
		var creature_seen = Player.have_already_seen_creature(creature);
		grid_container.add_child(instance);
		if creature_seen:
			label.text = creature.species_name;
		instance.init_item(creature, creature_seen);
