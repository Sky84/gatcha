extends TextureButton
class_name CreatureController
 
@export var idle_time = 6;
@export var movement_speed = 5;

@onready var animation_player: AnimationPlayer = $AnimationPlayer;
@onready var texture_rect = $TextureRect

var _destination;

func _ready():
	animation_player.play("spawn");

func init_creature(creature_data: Dictionary):
	texture_rect.texture = load(creature_data.visuals[creature_data.type][creature_data.age]);

func init_pathfinding(max_size:Vector2):
	await get_tree().create_timer(randi_range(0, 5)).timeout;
	update_destination(max_size);
	
func update_destination(max_size:Vector2):
	animation_player.play("jump");
	_destination = Vector2(randi_range(0, max_size.x), randi_range(0, max_size.y));
	var direction = -1 if (position.x - _destination.x) < 0 else 1;
	var tween = create_tween();
	tween.tween_property(self, 'scale', Vector2(direction, 1), 0.3);
	tween.tween_property(self, 'position', _destination, movement_speed);
	await tween.finished;
	_tween_finished(max_size);
	
func _tween_finished(max_size:Vector2):
	animation_player.stop();
	await get_tree().create_timer(idle_time).timeout;
	update_destination(max_size);
