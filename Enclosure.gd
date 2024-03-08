extends Control

const ENCLOSURE_CREATURE_ITEM = preload("res://Buttons/enclosure_creature_item.tscn");
@onready var grid_container = $ScrollContainer2/GridContainer;

# When tab change, the visibility change too
func _on_visibility_changed():
	if visible:
		for creature in Player.current_creatures:
			var instance = ENCLOSURE_CREATURE_ITEM.instantiate();
			grid_container.add_child(instance);
			instance.init_item(creature);
			instance.sell_creature_pressed.connect(_on_sell_creature_pressed.bind(instance));
	else:
		for child in grid_container.get_children():
			child.sell_creature_pressed.disconnect(_on_sell_creature_pressed.bind(child));
			grid_container.remove_child(child);
			child.queue_free();

func _on_sell_creature_pressed(instance: EnclosureCreatureButton):
	if instance.locked:
		return;
	var tween = get_tree().create_tween();
	tween.tween_property(instance, "scale", Vector2(0, 0), 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN_OUT);
	await tween.finished;
	grid_container.remove_child(instance);
	Player.sell_creature(instance.current_creature);
	instance.queue_free();

func _on_sell_all_texture_button_pressed():
	for child in grid_container.get_children():
		_on_sell_creature_pressed(child);
