extends TextureButton
class_name EnclosureCreatureButton

@onready var texture_rect_item = $TextureRect;
@onready var label_name = $LabelName;
@onready var label_time = $LabelTime
@onready var texture_rect_2 = $TextureRect2;
@onready var type_texture = $TypeTexture;
@onready var animation_player = $AnimationPlayer;
@onready var sell_button = $SellButton;
@onready var lock_button = $LockButton;
@onready var boost_button = $BoostButton;
@onready var timer = $Timer;

var locked = false;

var current_creature: Dictionary;

signal sell_creature_pressed;
signal boost_creature_pressed;

func init_item(item_data):
	current_creature = item_data;
	_on_update_timer();
	set_rarity_type(item_data.type);
	if "locked" in current_creature:
		lock_button.button_pressed = current_creature.locked;
	timer.start(1);
	timer.timeout.connect(_on_update_timer);

func _on_update_timer():
	texture_rect_item.texture = load(current_creature[current_creature.type].visuals[current_creature.age]);
	label_name.text = current_creature[current_creature.type].species_name;
	if current_creature.age == "baby":
		label_time.text = Creatures.format_time(get_remaining_minutes());
	else:
		var tween = create_tween();
		tween.tween_property(boost_button, "scale", Vector2(0, 1), 0.7).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN_OUT);
		label_time.text = str(current_creature[current_creature.type].income_per_second)+"c/s";

func get_remaining_minutes() -> float:
	var time_elapsed = Time.get_unix_time_from_system() - current_creature.looted_time_seconds;
	var time_remaining_seconds = (current_creature[current_creature.type].minutes_before_adult * 60) - time_elapsed;
	return time_remaining_seconds / 60;

func set_rarity_type(type: String):
	if type == 'wood':
		type_texture.hide();
		return;
	type_texture.texture = load("res://Buttons/star"+type+".png");

func _on_sell_button_pressed():
	sell_button.mouse_filter = MOUSE_FILTER_IGNORE;
	sell_creature_pressed.emit();

func _on_lock_button_toggled(toggled_on: bool):
	current_creature.locked = toggled_on;
	locked = toggled_on;
	Player.set_lock_creature(current_creature, toggled_on);
	animation_player.stop();
	animation_player.play("lock_pressed");
	var target_scale = Vector2(0, 1) if toggled_on else Vector2.ONE;
	var tween = create_tween();
	tween.tween_property(sell_button, "scale", target_scale, 0.7).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN_OUT);

func _on_boost_button_pressed():
	BoostEventBus.boost_creature_pressed.emit(current_creature);
