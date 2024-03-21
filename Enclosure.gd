extends Control

const ENCLOSURE_CREATURE_ITEM = preload("res://Buttons/enclosure_creature_item.tscn");
@onready var grid_container = $ScrollContainer2/GridContainer;

func _ready():
	Player.on_boosted_creature.connect(_on_boosted_creature);
	Player.on_creature_added.connect(_update_buttons);

# When tab change, the visibility change too
func _on_visibility_changed():
	_update_buttons();

func _update_buttons():
	for child in grid_container.get_children():
		child.sell_creature_pressed.disconnect(_on_sell_creature_pressed.bind(child));
		grid_container.remove_child(child);
		child.queue_free();
	if visible:
		for creature in Player.current_creatures:
			var instance = ENCLOSURE_CREATURE_ITEM.instantiate();
			grid_container.add_child(instance);
			instance.init_item(creature);
			instance.sell_creature_pressed.connect(_on_sell_creature_pressed.bind(instance));

func _on_boosted_creature(creature_id: String, time_minutes_to_reduce: int):
	for instance in grid_container.get_children():
		if instance.current_creature.id == creature_id:
			instance.current_creature.looted_time_seconds -= time_minutes_to_reduce * 60;

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
