@tool
extends TextureButton
class_name ShopItem

const MONEY_COIN = "res://Buttons/moneycoin.png";
const DIAMOND_COIN = "res://Buttons/diamond.png";

enum ITEM_TYPE {
	BOOST,
	LOOTBOX,
	DIAMOND
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

@onready var animation_player = $AnimationPlayer;

func play_anim_pressed():
	animation_player.stop();
	animation_player.play("pressed");

func play_anim_blocked():
	animation_player.stop();
	animation_player.play("blocked");

func _update_item(item_price: float, item_image_url: String, item_name: String, item_money_type_texture: String):
	var texture_rect: TextureRect = get_node('TextureRect');
	var texture_coin_type = get_node("Price/TextureRect");
	texture_coin_type.hide();
	var name_label: Label = get_node('Name');
	var price_label: Label = get_node('Price');
	texture_rect.texture = load(item_image_url);
	name_label.text = item_name;
	if not item_money_type_texture.is_empty():
		price_label.text = str(item_price);
		texture_coin_type.show();
		texture_coin_type.texture = load(item_money_type_texture);
	else:
		price_label.text = str(item_price)+"€";

func _on_export_var_changes():
	var item_price: float = 0;
	var item_image_url: String = "res://icon.svg";
	var item_name: String = 'No Name';
	var item_money_type_texture: String;
	if not _item_id.is_empty():
		match _item_type:
			ITEM_TYPE.BOOST:
				if Boosts.Boosts.has(_item_id):
					var boost = Boosts.Boosts.get(_item_id);
					item_name = boost.name;
					item_price = boost.price;
					item_image_url = boost.visual;
					item_money_type_texture = DIAMOND_COIN if boost.money_type_id == "diamond" else MONEY_COIN;
					_object_data = boost;
			ITEM_TYPE.LOOTBOX:
				if LootBoxes.LootBoxes.has(_item_id):
					var loot_box = LootBoxes.LootBoxes.get(_item_id);
					item_name = loot_box.name;
					item_price = loot_box.price;
					item_image_url = loot_box.visual;
					item_money_type_texture = DIAMOND_COIN if loot_box.money_type_id == "diamond" else MONEY_COIN;
					_object_data = loot_box;
			ITEM_TYPE.DIAMOND:
				if Diamonds.Diamonds.has(_item_id):
					var diamond = Diamonds.Diamonds.get(_item_id);
					item_name = diamond.name;
					item_price = diamond.price;
					item_image_url = diamond.visual;
					_object_data = diamond;
		_update_item(item_price, item_image_url, item_name, item_money_type_texture);

func get_object_data():
	return _object_data;
