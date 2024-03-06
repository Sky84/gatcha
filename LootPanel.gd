extends Control
class_name LootPanel

const LOOT_ITEM = preload("res://LootBoxes/loot_item.tscn");

var opened_loot_item: Array = [];

@onready var start_loot_position: Vector2 = $StartLootPosition.global_position;

func open(shop_item: ShopItem):
	show();
	var shop_item_data = shop_item.get_object_data();
	_process_loot_rate(shop_item_data);

func _process_loot_rate(shop_item_data):
	if opened_loot_item.size() < 9:
		var loot_type: String = get_lootbox_type(shop_item_data);
		var creature = get_random_creature().duplicate(true);
		var instance_loot: LootItem = LOOT_ITEM.instantiate();
		add_child(instance_loot);
		instance_loot.position = start_loot_position;
		creature.type = loot_type;
		creature.age = "baby";
		instance_loot.init_item(creature);
		update_loot_node_position(instance_loot);
		opened_loot_item.append(instance_loot);
		instance_loot.pressed.connect(_on_instance_loot_pressed.bind(instance_loot));
		
func _on_instance_loot_pressed(instance_loot: LootItem):
	opened_loot_item.erase(instance_loot);
	#TODO TWEEN BEFORE REMOVE
	remove_child(instance_loot);
	Player.add_creature(instance_loot.current_item);

func update_loot_node_position(instance_loot: TextureButton):
	instance_loot.scale = Vector2.ZERO;
	var margin = 30; 
	var target_pos_x = ((opened_loot_item.size() % 3) * 340) + margin;
	var target_pos_y = ((opened_loot_item.size() / 3) * 340) + margin;
	var target_pos = Vector2(target_pos_x, target_pos_y);
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
	print("Received ", chosen_reward, " from the ", shop_item_data["name"], " lootbox!")
	return chosen_reward;

func get_random_creature() -> Dictionary:
	var random_creature_id = Creatures.Creatures.keys()[randi() % Creatures.Creatures.size()]; # Sélection aléatoire d'un ID de créature parmi les disponibles
	var creature = Creatures.Creatures[random_creature_id];
	return creature;
