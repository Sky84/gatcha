extends Control

const BOOST = preload("res://Boosts/boost.tscn");
@onready var grid_container = $NinePatchRect/ScrollContainer2/GridContainer;
@onready var menu: Menu = $"..";

func init_panel(creature_data_to_boost):
	for child in grid_container.get_children():
		grid_container.remove_child(child);
		child.queue_free();
	for boost_id in Player.boosts:
		var boost = Player.boosts[boost_id].duplicate(true);
		var instance = BOOST.instantiate();
		grid_container.add_child(instance);
		instance.init_item(boost);
		instance.pressed.connect(_on_boost_creature.bind(creature_data_to_boost, instance));

func _on_boost_creature(creature_to_boost, instance):
	instance.boost = Player.remove_boost(instance.boost);
	instance.update();
	if instance.boost.amount == 0:
		grid_container.remove_child(instance);
	BoostEventBus.on_boost_creature.emit(creature_to_boost, instance.boost.time_minutes_to_add);

func _on_close_button_pressed():
	var tween = create_tween();
	tween.tween_property(self, "position:y", size.y, 0.5).set_trans(Tween.TRANS_BACK);
	menu._on_enclosure_button_pressed();
