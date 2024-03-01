extends Control
class_name Shop

@onready var loot_panel: LootPanel = $LootPanel;

#Array[ShopItem]
var _shop_item_buttons: Array[Node];

# Called when the node enters the scene tree for the first time.
func _ready():
	_shop_item_buttons = get_tree().get_nodes_in_group('shop_item_button');
	for button in _shop_item_buttons:
		button.pressed.connect(_on_pressed_shop_item.bind(button));

func _on_pressed_shop_item(shop_item: ShopItem):
	loot_panel.open(shop_item);
