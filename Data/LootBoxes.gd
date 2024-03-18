extends Node
const LootBoxes = {
	"wood": {
		"name": "Wood",
		"visual": "res://LootBoxes/WoodLootbox.png",
		"price": 10,
		"money_type_id": "coin",
		"wood_loot_rate": 90,
		"bronze_loot_rate": 5,
		"silver_loot_rate": 3,
		"gold_loot_rate": 1.99,
		"diamond_loot_rate": 0.1
	},
	"bronze": {
		"name": "Bronze",
		"visual": "res://LootBoxes/BronzeLootbox.png",
		"price": 50,
		"money_type_id": "coin",
		"wood_loot_rate": 80,
		"bronze_loot_rate": 10,
		"silver_loot_rate": 5,
		"gold_loot_rate": 4.50,
		"diamond_loot_rate": 0.50
	},
	"silver": {
		"name": "Silver",
		"visual": "res://LootBoxes/SilverLootbox.png",
		"price": 100,
		"money_type_id": "coin",
		"wood_loot_rate": 50,
		"bronze_loot_rate": 30,
		"silver_loot_rate": 10,
		"gold_loot_rate": 9.20,
		"diamond_loot_rate": 0.70
	},
	"gold": {
		"name": "Gold",
		"visual": "res://LootBoxes/GoldLootbox.png",
		"price": 2,
		"money_type_id": "diamond",
		"wood_loot_rate": 0,
		"bronze_loot_rate": 0,
		"silver_loot_rate": 0,
		"gold_loot_rate": 99,
		"diamond_loot_rate": 1
	},
	"diamond": {
		"name": "Diamond",
		"visual": "res://LootBoxes/DiamondLootbox.png",
		"price": 5,
		"money_type_id": "diamond",
		"wood_loot_rate": 0,
		"bronze_loot_rate": 0,
		"silver_loot_rate": 0,
		"gold_loot_rate": 10,
		"diamond_loot_rate": 90
	}
}
