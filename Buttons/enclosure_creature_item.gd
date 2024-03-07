extends TextureButton

@onready var texture_rect_item = $TextureRect;
@onready var label_name = $LabelName;
@onready var label_time = $LabelTime
@onready var texture_rect_2 = $TextureRect2;
@onready var type_texture = $TypeTexture;

func init_item(item_data):
	texture_rect_item.texture = load(item_data.visuals[item_data.type][item_data.age]);
	label_name.text = item_data.species_name;
	#label_time.text = str(item_data);
	set_rarity_type(item_data.type);


func set_rarity_type(type: String):
	if type == 'wood':
		type_texture.hide();
		return;
	type_texture.texture = load("res://Buttons/star"+type+".png");
