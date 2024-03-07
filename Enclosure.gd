extends Control

const ENCLOSURE_CREATURE_ITEM = preload("res://Buttons/enclosure_creature_item.tscn");
@onready var grid_container = $ScrollContainer2/GridContainer

# When tab change, the visibility change too
func _on_visibility_changed():
	if visible:
		for creature in Player.current_creatures:
			var instance = ENCLOSURE_CREATURE_ITEM.instantiate();
			grid_container.add_child(instance);
			instance.init_item(creature);
	else:
		for child in grid_container.get_children():
			grid_container.remove_child(child);
			child.queue_free();
