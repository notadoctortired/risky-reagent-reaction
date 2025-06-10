extends Control

func _ready():
	$Transition.visible = true
	$Transition/AnimationPlayer.play("Global/fade in")
	if name == "front_origin":
		_clear_from_last()

func _clear_from_last():
	var file = FileAccess.open("res://scripts/reactions/current_flask.txt", FileAccess.WRITE)
	file.store_string("")
