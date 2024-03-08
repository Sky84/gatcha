extends Node

const CREATURE = preload("res://Creature/Creature.tscn");
@onready var creature_container: Control = get_node('/root/Game/CanvasLayer/Background/CreatureContainer');
@onready var creature_max_label: Label = get_node('/root/Game/CanvasLayer/HUD/CreatureMax/Label');
@onready var coin_label: Label = get_node('/root/Game/CanvasLayer/HUD/Coin/Label');

var current_creatures: Array = [];
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
	_update_HUD();

func have_already_seen_creature(creature_data) -> bool:
	var creature_id = Creatures.get_creature_id(creature_data);
	for petdex_creature in Player.petdex:
		if petdex_creature.id == creature_id:
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

func _update_HUD():
	creature_max_label.text = str(Player.current_creatures.size())+"/"+str(Creatures.MAX_CREATURES);
	coin_label.text = str(Player.money);
