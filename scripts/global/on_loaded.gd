extends Control

func _ready():
	$Transition.visible = true
	$Transition/AnimationPlayer.play("Global/fade in")
	if name == "front_origin":
		_clear_from_last()
	if name == "bunny_ending_origin":
		_bunny_ending()
		$Timer.timeout.connect(_timeout)
		

func _clear_from_last():
	var file = FileAccess.open("res://scripts/reactions/current_flask.txt", FileAccess.WRITE)
	file.store_string("")
	
func _bunny_ending():
	$was_crime_bunny/AnimationPlayer.play("Global/evil_bunny")
	$Timer.start(7)
	
func _timeout():
	get_tree().exit()
	
