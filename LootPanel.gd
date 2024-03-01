extends Panel
class_name LootPanel

const LOOT_ITEM = preload("res://LootBoxes/loot_item.tscn");

func open(shop_item: ShopItem):
	var shop_item_data = shop_item.get_object_data();
	$LootBox/TextureRect.texture = load(shop_item_data.visual);
	show();

func _on_loot_box_pressed():
	pass # Replace with function body.
