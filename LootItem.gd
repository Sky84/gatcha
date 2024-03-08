extends TextureButton
class_name LootItem

enum ITEM_RARITY {
	WOOD,
	BRONZE,
	SILVER,
	GOLD,
	DIAMOND,
}

var item_id: String = '';
var item_rarity: ITEM_RARITY;
@onready var texture_rect = $TextureRect;
@onready var animation_player = $AnimationPlayer;
@onready var label_name = $LabelName;
@onready var label_time = $LabelTime;
@onready var texture_rect_rarity_type = $TextureRect2;
@onready var texture_rect_type = $TypeTexture;

var current_item: Dictionary;

func _ready():
	animation_player.play("default_shake");

func init_item(item_data):
	current_item = item_data;
	label_name.text = item_data.species_name;
	texture_rect.texture = load(item_data.visuals[item_data.type].baby);
	set_rarity_type(item_data.type);

func set_rarity_type(type: String):
	if type == 'wood':
		texture_rect_type.hide();
		return;
	texture_rect_type.texture = load("res://Buttons/star"+type+".png");
