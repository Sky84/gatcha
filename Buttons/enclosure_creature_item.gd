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

var locked = false;

var current_creature: Dictionary;

signal sell_creature_pressed;

func init_item(item_data):
	texture_rect_item.texture = load(item_data.visuals[item_data.type][item_data.age]);
	label_name.text = item_data.species_name;
	#label_time.text = str(item_data);
	set_rarity_type(item_data.type);
	current_creature = item_data;
	if "locked" in current_creature:
		lock_button.button_pressed = current_creature.locked;

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
	
