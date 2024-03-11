extends TextureButton

@onready var texture_rect = $TextureRect;
@onready var label_name = $Label;
@onready var label_amount = $Label2

var boost;

func init_item(boost_data):
	boost = boost_data;
	update();

func update():
	label_name.text = boost.name;
	label_amount.text = str(boost.amount);
	texture_rect.texture = load(boost.visual);
