extends TextureButton

@onready var texture_rect_item = $TextureRect;
@onready var texture_rect_2 = $TextureRect2;
@onready var type_texture = $TypeTexture;

func init_item(item_data, already_seen: bool):
	if not already_seen:
		type_texture.hide();
		texture_rect_2.hide();
		texture_rect_item.self_modulate = Color.BLACK;
	else:
		texture_rect_item.self_modulate = Color.WHITE;
	texture_rect_item.texture = load(item_data[item_data.type].visuals[item_data.age]);
	set_rarity_type(item_data.type);

func set_rarity_type(type: String):
	if type == 'wood':
		type_texture.hide();
		return;
	type_texture.texture = load("res://Buttons/star"+type+".png");
