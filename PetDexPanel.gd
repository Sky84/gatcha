extends Control

const PETDEX_CREATURE_ROW = preload("res://PetDex/petdex_creature_row.tscn");
@onready var grid_container = $NinePatchRect/ScrollContainer2/GridContainer;
@onready var menu: Menu = $"..";

func init_panel():
	for child in grid_container.get_children():
		grid_container.remove_child(child);
		child.queue_free();
	for creature_species_id in Creatures.Creatures:
		var creature = Creatures.Creatures[creature_species_id].duplicate(true);
		var instance_row = PETDEX_CREATURE_ROW.instantiate();
		grid_container.add_child(instance_row);
		instance_row.init_row(creature);

func _on_close_button_pressed():
	var tween = create_tween();
	tween.tween_property(self, "position:y", size.y, 0.5).set_trans(Tween.TRANS_BACK);
	menu._on_enclosure_button_pressed();
