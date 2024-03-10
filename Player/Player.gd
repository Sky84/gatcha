extends Node

const CREATURE = preload("res://Creature/Creature.tscn");
@onready var creature_container: Control = get_node('/root/Game/CanvasLayer/Background/CreatureContainer');
@onready var creature_max_label: Label = get_node('/root/Game/CanvasLayer/HUD/CreatureMax/Label');
@onready var coin_label: Label = get_node('/root/Game/CanvasLayer/HUD/Coin/Label');

var current_creatures: Array = [];
var locked_creatures: Array = [];
var petdex: Array = [];
var money = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	_load_save();

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
	update_HUD();

func set_lock_creature(creature, lock: bool) -> void:
	if lock:
		Player.locked_creatures.append(creature);
	else:
		Player.locked_creatures.erase(creature);
	Save.save_data();

func sell_creature(creature):
	Player.current_creatures.erase(creature);
	Player.money += creature.selling_value;
	var tween = get_tree().create_tween();
	for child_creature in creature_container.get_children():
		if child_creature.id == creature.id:
			tween.tween_property(child_creature, "global_position", Vector2(200, 0), 0.7).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN_OUT);
			await tween.finished;
			print(creature.id)
			creature_container.remove_child(child_creature);
			child_creature.queue_free();
			break;
	update_HUD();
	Save.save_data();

func have_already_seen_creature(creature_data) -> bool:
	for petdex_creature in Player.petdex:
		if petdex_creature.species_name == creature_data.species_name\
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
	coin_label.text = str(Player.money);
