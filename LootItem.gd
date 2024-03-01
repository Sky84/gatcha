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

# Called when the node enters the scene tree for the first time.
func _ready():
	var creature = Creatures.Creatures.get(item_id);
	texture_rect.texture = load(creature.visuals[item_rarity]);
