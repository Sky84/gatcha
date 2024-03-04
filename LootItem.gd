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

func init_item(item_data):
	texture_rect.texture = load(item_data.visuals[item_data.type].baby);
