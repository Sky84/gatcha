extends Control
class_name LootPanel

const LOOT_ITEM = preload("res://LootBoxes/loot_item.tscn");

var opened_loot_item: Array = [];

signal on_all_loot_collected;

@onready var start_loot_position: Vector2 = $StartLootPosition.global_position;

func open(shop_item: ShopItem):
	show();
	var shop_item_data = shop_item.get_object_data();
	_process_loot_rate(shop_item_data);

func collect_all_loot():
	for i in range(opened_loot_item.size() -1, -1, -1):
		_on_instance_loot_pressed(opened_loot_item[i]);
	on_all_loot_collected.emit();

func _process_loot_rate(shop_item_data):
	if opened_loot_item.size() >= 9:
		collect_all_loot();
	var loot_type: String = get_lootbox_type(shop_item_data);
	var creature = get_random_creature().duplicate(true);
	var instance_loot: LootItem = LOOT_ITEM.instantiate();
	add_child(instance_loot);
	instance_loot.position = start_loot_position;
	creature.type = loot_type;
	creature.age = "baby";
	creature.id = generate_creature_id(get_child_count(), creature);
	creature.looted_time_seconds = Time.get_unix_time_from_system();
	instance_loot.init_item(creature);
	var instance_target_position = Vector2.ZERO;
	if loot_type == "gold" or loot_type == "diamond":
		instance_loot.play_epic_animations();
	update_loot_node_position(instance_loot, instance_target_position);
	opened_loot_item.append(instance_loot);
	instance_loot.pressed.connect(_on_instance_loot_pressed.bind(instance_loot));

func generate_creature_id(instance_index, creature_data) -> String:
	return str(instance_index)+str(Player.current_creatures.size())+"_"+creature_data.type+"_"+creature_data[creature_data.type].species_name+"_"+str(Time.get_ticks_msec());

func _on_instance_loot_pressed(instance_loot: LootItem):
	instance_loot.pressed.disconnect(_on_instance_loot_pressed.bind(instance_loot));
	opened_loot_item.erase(instance_loot);
	var tween = get_tree().create_tween();
	var target_pos = Vector2(700, -400);
	tween.tween_property(instance_loot, "position", target_pos, 0.5).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN_OUT);
	await tween.finished;
	remove_child(instance_loot);
	Player.add_creature(instance_loot.current_item);
	Save.save_data();

func update_loot_node_position(instance_loot: TextureButton, target_position: Vector2 = Vector2.ZERO):
	instance_loot.scale = Vector2.ZERO;
	var margin = Vector2(30, 60);
	var target_pos_x = ((opened_loot_item.size() % 3) * 340) + margin.x;
	var target_pos_y = ((opened_loot_item.size() / 3) * 340) + margin.y;
	var target_pos = Vector2(target_pos_x, target_pos_y) if target_position == Vector2.ZERO else target_position;
	var tween = get_tree().create_tween();
	tween.set_parallel();
	tween.tween_property(instance_loot, "position", target_pos, 0.5).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN_OUT);
	tween.tween_property(instance_loot, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_SPRING).set_ease(Tween.EASE_IN_OUT);

func get_lootbox_type(shop_item_data) -> String:
	var total_rate = shop_item_data["wood_loot_rate"] + shop_item_data["bronze_loot_rate"] + shop_item_data["silver_loot_rate"] + shop_item_data["gold_loot_rate"] + shop_item_data["diamond_loot_rate"]
	var random_number = randf() * total_rate;
	var current_rate = 0;

	var possible_rewards = [];

	possible_rewards.append("wood");
	if random_number < (current_rate + shop_item_data["bronze_loot_rate"]):
		possible_rewards.append("bronze");
	if random_number < (current_rate + shop_item_data["silver_loot_rate"]):
		possible_rewards.append("silver");
	if random_number < (current_rate + shop_item_data["gold_loot_rate"]):
		possible_rewards.append("gold");
	if random_number < (current_rate + shop_item_data["diamond_loot_rate"]):
		possible_rewards.append("diamond");

	var chosen_reward = possible_rewards[randi() % possible_rewards.size()];
	return chosen_reward;

func get_random_creature() -> Dictionary:
	var random_creature_id = Creatures.Creatures.keys()[randi() % Creatures.Creatures.size()]; # Sélection aléatoire d'un ID de créature parmi les disponibles
	var creature = Creatures.Creatures[random_creature_id];
	return creature;
