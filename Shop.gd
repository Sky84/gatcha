extends Control
class_name Menu

@onready var loot_panel: LootPanel = $LootPanel;

#Array[ShopItem]
var _shop_item_buttons: Array[Node];

enum TAB_INDEX {
	SHOP,
	PET_DEX,
	ENCLOSURE
}

@onready var tab_buttons = $TabButtons
@onready var tab_container = $TabContainer
@onready var petdex_panel = $PetDexPanel;
@onready var creature_max_label = $"../HUD/CreatureMax/Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	_shop_item_buttons = get_tree().get_nodes_in_group('shop_item_button');
	for button in _shop_item_buttons:
		button.pressed.connect(_on_pressed_shop_item.bind(button));
	

func _on_pressed_shop_item(shop_item: ShopItem):
	if Player.current_creatures.size() <= Creatures.MAX_CREATURES:
		shop_item.play_anim_pressed();
		loot_panel.open(shop_item);
	else:
		var tween = create_tween();
		tween.tween_property(creature_max_label, "scale", Vector2(1.5, 1.5), 0.5).set_trans(Tween.TRANS_BACK);
		tween.tween_property(creature_max_label, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_BACK);
		shop_item.play_anim_blocked();

func _on_shop_button_pressed():
	_change_tab(TAB_INDEX.SHOP);

func _on_pet_dex_button_pressed():
	_change_tab(TAB_INDEX.PET_DEX);
	var tween = create_tween();
	tween.tween_property(petdex_panel, "position:y", 0, 0.5).set_trans(Tween.TRANS_BACK);
	petdex_panel.init_panel();

func _on_enclosure_button_pressed():
	_change_tab(TAB_INDEX.ENCLOSURE);

func _on_close_button_pressed():
	var tween = create_tween();
	tween.set_parallel();
	var opened_menu_pos_y = 1276;
	var hidden_menu_pos_y = 1276 * 2;
	var tab_container_target_pos_y = opened_menu_pos_y if tab_container.position.y == hidden_menu_pos_y else hidden_menu_pos_y;
	tween.tween_property(tab_container, "position:y", tab_container_target_pos_y, 0.5).set_trans(Tween.TRANS_BACK);
	var opened_buttons_menu_pos_y = 1238;
	var hidden_buttons_menu_pos_y = 1238 * 1.5;
	var tab_buttons_target_pos_y = opened_buttons_menu_pos_y if tab_buttons.position.y == hidden_buttons_menu_pos_y else hidden_buttons_menu_pos_y;
	tween.tween_property(tab_buttons, "position:y", tab_buttons_target_pos_y, 0.6).set_trans(Tween.TRANS_BACK);

func _change_tab(index: int):
	var tween = create_tween();
	var button_clicked = tab_buttons.get_child(index);
	var not_clicked_pos_y = 8;
	var clicked_pos_y = -16;
	tween.set_parallel();
	tween.tween_property(button_clicked, "position:y", clicked_pos_y, 0.2).set_trans(Tween.TRANS_BACK);
	for child in tab_buttons.get_children():
		if child.get_index() != button_clicked.get_index():
			tween.tween_property(child, "position:y", not_clicked_pos_y, 0.3).set_trans(Tween.TRANS_BACK);
	tab_container.current_tab = index;
