extends TextureButton
class_name CreatureController
 
@export var idle_time = 6;
@export var movement_speed = 5;

@onready var animation_player: AnimationPlayer = $AnimationPlayer;
@onready var texture_rect = $TextureRect
@onready var timer = $Timer;
@onready var gain_money_label = $GainMoneyLabel

var _destination;
var id: String;

const SECONDS_BEFORE_GAIN = 5;

func _ready():
	gain_money_label.self_modulate.a = 0;
	animation_player.play("spawn");

func init_creature(creature_data: Dictionary):
	id = creature_data.id;
	texture_rect.texture = load(creature_data[creature_data.type].visuals[creature_data.age]);
	timer.start(SECONDS_BEFORE_GAIN);
	timer.timeout.connect(_on_timeout.bind(creature_data));
	_check_need_to_grow(creature_data);

func _on_timeout(creature_data):
	if creature_data.age == "baby":
		_check_need_to_grow(creature_data);
	else:
		_earn_money(creature_data[creature_data.type].income_per_second);

func _check_need_to_grow(creature_data):
	var time_elapsed = Time.get_unix_time_from_system() - creature_data.looted_time_seconds;
	var time_remaining = (creature_data[creature_data.type].minutes_before_adult * 60) - time_elapsed;
	if time_remaining <= 0:
		creature_data.age = "adult";
		texture_rect.texture = load(creature_data[creature_data.type].visuals[creature_data.age]);

func _earn_money(money_per_seconds: int) -> void:
	var money_to_gain = money_per_seconds * SECONDS_BEFORE_GAIN;
	gain_money_label.text = "+ "+str(money_to_gain);
	var tween = create_tween();
	var start_y = -150;
	var end_y = -300;
	gain_money_label.position.y = start_y;
	gain_money_label.scale.x = scale.x;
	tween.set_parallel();
	tween.tween_property(gain_money_label, "self_modulate:a", 1, 1);
	tween.tween_property(gain_money_label, "position:y", end_y, 0.5).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT);
	tween.chain().tween_property(gain_money_label, "self_modulate:a", 0, 0.5);
	Player.money += money_to_gain;
	Player.update_HUD();

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
