extends Node

var current_creatures = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_creature(creature_data: Dictionary):
	current_creatures.append(creature_data);
