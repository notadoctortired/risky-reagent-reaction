extends ColorRect

func _ready():
	_save_to_file("")
	
func _save_to_file(content):
	var file = FileAccess.open("res://scripts/reactions/current_flask.txt", FileAccess.WRITE)
	file.store_string(content)
	
	file = FileAccess.open("res://scripts/clock/time_left.txt", FileAccess.WRITE)
	file.store_string(content)
