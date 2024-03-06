extends Node

const CREATURE = preload("res://Creature/Creature.tscn");
@onready var creature_container = get_node('/root/Game/Background/CreatureContainer');

var current_creatures = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_creature(creature_data: Dictionary):
	current_creatures.append(creature_data);
	var creature_instance: CreatureController = CREATURE.instantiate();
	var max_position = creature_container.global_position + creature_container.size;
	var random_position = Vector2(randi_range(creature_container.global_position.x, max_position.x),
		 randi_range(creature_container.global_position.y, max_position.y));
	creature_container.add_child(creature_instance);
	creature_instance.global_position = random_position;
	creature_instance.init_creature(creature_data);
	creature_instance.init_pathfinding(creature_container.size);
