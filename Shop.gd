extends Control
class_name Menu

@onready var loot_panel: LootPanel = $LootPanel;
@onready var boost_panel = $BoostPanel

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
@onready var coin_label = $"../HUD/Coin/Label";
@onready var diamond_label = $"../HUD/Diamond/Label";
@onready var close_button = $TabButtons/CloseButton
@onready var shop_button = $TabButtons/ShopButton
@onready var enclosure_button = $TabButtons/EnclosureButton
@onready var pet_dex_button = $TabButtons/PetDexButton

# Called when the node enters the scene tree for the first time.
func _ready():
	_shop_item_buttons = get_tree().get_nodes_in_group('shop_item_button');
	for button in _shop_item_buttons:
		button.pressed.connect(_on_pressed_shop_item.bind(button));
	BoostEventBus.boost_creature_pressed.connect(_on_boost_open_panel);
	BoostEventBus.on_boost_creature.connect(Player.on_boost_creature);

func _on_pressed_shop_item(shop_item: ShopItem):
	if shop_item._object_data.money_type_id == "euros":
		_handle_euros_payment(shop_item);
		return;
	var money_label = diamond_label if shop_item._object_data.money_type_id == "diamond" else coin_label;
	if Player[shop_item._object_data.money_type_id] < shop_item._object_data.price:
		var tween = create_tween();
		tween.tween_property(money_label, "scale", Vector2(1.5, 1.5), 0.5).set_trans(Tween.TRANS_BOUNCE);
		tween.tween_property(money_label, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_BOUNCE);
		shop_item.play_anim_blocked();
		return;
	match shop_item.item_type:
		shop_item.ITEM_TYPE.LOOTBOX:
			if Player.current_creatures.size() + loot_panel.opened_loot_item.size() >= Creatures.MAX_CREATURES:
				var tween = create_tween();
				tween.tween_property(creature_max_label, "scale", Vector2(1.5, 1.5), 0.5).set_trans(Tween.TRANS_BACK);
				tween.tween_property(creature_max_label, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_BACK);
				shop_item.play_anim_blocked();
				return
			loot_panel.open(shop_item);
		shop_item.ITEM_TYPE.BOOST:
			_on_boost_buy(shop_item);
	shop_item.play_anim_pressed();
	Player[shop_item._object_data.money_type_id] -= shop_item._object_data.price;
	Player.update_HUD();

func _handle_euros_payment(shop_item: ShopItem):
	PayService.purchase(shop_item.item_id);

func _on_boost_buy(boost_shop_item: ShopItem):
	Player.add_boost(boost_shop_item.item_id, boost_shop_item._object_data);
	var boost_shop_item_fake = boost_shop_item.duplicate();
	add_child(boost_shop_item_fake);
	boost_shop_item_fake.scale = Vector2.ZERO;
	boost_shop_item_fake.global_position = boost_shop_item.global_position;
	var tween = create_tween();
	tween.set_parallel();
	tween.tween_property(boost_shop_item_fake, "position:y", boost_shop_item_fake.global_position.y - 450, 0.5).set_trans(Tween.TRANS_BACK);
	tween.tween_property(boost_shop_item_fake, "scale", Vector2(0.2,0.2), 0.5).set_trans(Tween.TRANS_BACK);
	await tween.finished;
	remove_child(boost_shop_item_fake);
	boost_shop_item_fake.queue_free();

func _on_boost_open_panel(creature_data):
	var tween = create_tween();
	tween.tween_property(boost_panel, "position:y", 0, 0.5).set_trans(Tween.TRANS_BACK);
	boost_panel.init_panel(creature_data);

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
	var opened_menu_pos_y = 1276;
	var hidden_menu_pos_y = 1276 * 2;
	var is_tab_opened = tab_container.position.y == opened_menu_pos_y;
	tween.set_parallel();
	for button in [shop_button, enclosure_button, pet_dex_button]:
		tween.tween_property(button, "scale", Vector2.ZERO if is_tab_opened else Vector2.ONE, 0.3).set_trans(Tween.TRANS_BACK);
	var tab_container_target_pos_y = opened_menu_pos_y if not is_tab_opened else hidden_menu_pos_y;
	tween.tween_property(tab_container, "position:y", tab_container_target_pos_y, 0.5).set_trans(Tween.TRANS_BACK);
	var opened_buttons_menu_pos_y = 1238;
	var hidden_buttons_menu_pos_y = 1800;
	var opened_button_close_rotation = 180;
	var hidden_button_close_rotation = 0;
	tween.tween_property(close_button, "rotation_degrees", opened_button_close_rotation if not is_tab_opened else hidden_button_close_rotation, 0.5);
	var tab_buttons_target_pos_y = opened_buttons_menu_pos_y if not is_tab_opened else hidden_buttons_menu_pos_y;
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
