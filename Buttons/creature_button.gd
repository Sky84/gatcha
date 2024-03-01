@tool
extends TextureButton
class_name ShopItem

enum ITEM_TYPE {
	BOOST,
	LOOTBOX
}

var _item_id: String;
var _item_type: ITEM_TYPE;

var _object_data: Dictionary;

@export var item_id: String:
	get:
		return _item_id;
	set(value):
		_item_id = value;
		_on_export_var_changes();

@export var item_type: ITEM_TYPE:
	get:
		return _item_type;
	set(value):
		_item_type = value;
		_on_export_var_changes();

func _update_item(item_price: int, item_image_url: String, item_name: String):
	var texture_rect: TextureRect = get_node('TextureRect');
	var name_label: Label = get_node('Name');
	var price_label: Label = get_node('Price');
	#texture_rect.texture = load(item_image_url);
	#name_label.text = item_name;
	#price_label.text = str(item_price);

func _on_export_var_changes():
	var item_price: int = 0;
	var item_image_url: String = "res://icon.svg";
	var item_name: String = 'No Name';
	if not _item_id.is_empty():
		match _item_type:
			ITEM_TYPE.BOOST:
				if Boosts.Boosts.has(_item_id):
					var boost = Boosts.Boosts.get(_item_id);
					item_name = boost.name;
					item_price = boost.price;
					item_image_url = boost.visual;
					_object_data = boost;
			ITEM_TYPE.LOOTBOX:
				if LootBoxes.LootBoxes.has(_item_id):
					var loot_box = LootBoxes.LootBoxes.get(_item_id);
					item_name = loot_box.name;
					item_price = loot_box.price;
					item_image_url = loot_box.visual;
					_object_data = loot_box;
		_update_item(item_price, item_image_url, item_name);

func get_object_data():
	return _object_data;
