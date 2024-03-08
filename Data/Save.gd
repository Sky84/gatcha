extends Node

const save_path = "user://player.save";

const DEFAULT_SAVE = {
			"current_creatures": [],
			"petdex": [],
			"money": 10
		};

func get_save():
	var file = FileAccess.open(save_path, FileAccess.READ);
	if file:
		var json = JSON.parse_string(file.get_as_text());
		return {
			"current_creatures": json["current_creatures"],
			"petdex": json["petdex"],
			"money": json["money"]
		}
	return DEFAULT_SAVE;

func save_data():
	var data_to_save = {
			"current_creatures": Player.current_creatures,
			"petdex": Player.petdex,
			"money": Player.money
		};
	var file = FileAccess.open(save_path, FileAccess.WRITE);
	file.store_string(JSON.stringify(data_to_save));
	file.close();

func _notification(notification):
	if notification == NOTIFICATION_WM_CLOSE_REQUEST or notification == NOTIFICATION_WM_GO_BACK_REQUEST:       
		save_data();
		get_tree().quit();

