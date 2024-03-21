extends Node

const CREATURE = preload("res://Creature/Creature.tscn");
@onready var creature_container: Control = get_node('/root/Game/CanvasLayer/Background/CreatureContainer');
@onready var creature_max_label: Label = get_node('/root/Game/CanvasLayer/HUD/CreatureMax/Label');
@onready var coin_label: Label = get_node('/root/Game/CanvasLayer/HUD/Coin/Label');
@onready var diamond_label = get_node('/root/Game/CanvasLayer/HUD/Diamond/Label');

var current_creatures: Array = [];
var locked_creatures: Array = [];
var petdex: Array = [];
var coin = 0;
var diamond = 0;
var boosts = {};

signal on_boosted_creature;
signal on_creature_added;

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_save();
	update_HUD();

func add_creature(creature_data: Dictionary, from_save: bool = false):
	if not from_save:
		current_creatures.append(creature_data);
	if not have_already_seen_creature(creature_data):
		Player.petdex.append(creature_data);
	var creature_instance: CreatureController = CREATURE.instantiate();
	var max_position = creature_container.global_position + creature_container.size;
	var random_position = Vector2(randi_range(creature_container.global_position.x, max_position.x),
		 randi_range(creature_container.global_position.y, max_position.y));
	creature_container.add_child(creature_instance);
	creature_instance.global_position = random_position;
	creature_instance.init_creature(creature_data);
	creature_instance.init_pathfinding(creature_container.size);
	on_creature_added.emit();
	update_HUD();

func set_lock_creature(creature, lock: bool) -> void:
	if lock:
		Player.locked_creatures.append(creature);
	else:
		Player.locked_creatures.erase(creature);
	Save.save_data();

func sell_creature(creature):
	Player.current_creatures.erase(creature);
	Player.coin += creature[creature.type].selling_value;
	var tween = get_tree().create_tween();
	for child_creature in creature_container.get_children():
		if child_creature.id == creature.id:
			tween.tween_property(child_creature, "global_position", Vector2(200, 0), 0.7).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN_OUT);
			await tween.finished;
			creature_container.remove_child(child_creature);
			child_creature.queue_free();
			break;
	update_HUD();
	Save.save_data();

func on_boost_creature(creature_data, time_minutes_to_reduce):
	for creature in Player.current_creatures:
		if creature.id == creature_data.id:
			creature.looted_time_seconds -= time_minutes_to_reduce * 60;
	for creature in Player.creature_container.get_children():
		if creature.id == creature_data.id:
			creature.play_boosted();
			break;
	Save.save_data();
	Player.on_boosted_creature.emit(creature_data.id, time_minutes_to_reduce);

func add_boost(boost_id: String, boost_data: Dictionary) -> void:
	if boost_id in Player.boosts:
		Player.boosts[boost_id].amount += 1;
	else:
		Player.boosts[boost_id] = {
			"name": boost_data.name,
			"amount": 1,
			"item_id": boost_id,
			"time_minutes_to_add": boost_data.time_minutes_to_add,
			"visual": boost_data.visual
		};

func remove_boost(boost_data) -> Dictionary:
	Player.boosts[boost_data.item_id].amount = max(0, Player.boosts[boost_data.item_id].amount - 1);
	return Player.boosts[boost_data.item_id];

func have_already_seen_creature(creature_data) -> bool:
	for petdex_creature in Player.petdex:
		if petdex_creature[petdex_creature.type].species_name == creature_data[creature_data.type].species_name\
			and petdex_creature.type == creature_data.type:
			return true;
	return false;

func _load_save():
	var save = Save.get_save().duplicate(true);
	for key in save.keys():
		if key in self:
			self[key] = save[key];
	
	if not creature_container.is_node_ready():
		await creature_container.ready;
	for i in Player.current_creatures.size():
		Player.add_creature(Player.current_creatures[i], true);

func update_HUD():
	creature_max_label.text = str(Player.current_creatures.size())+"/"+str(Creatures.MAX_CREATURES);
	coin_label.text = str(Player.coin);
	diamond_label.text = str(Player.diamond);
