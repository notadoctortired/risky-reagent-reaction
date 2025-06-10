extends Button

var anim_plr = ""

func _ready():
	anim_plr = get_parent().get_node("Transition/AnimationPlayer")
	pressed.connect(_button_pressed)
	
	$Timer.timeout.connect(_timeout)
	
func _button_pressed():
	$Timer.start()
	anim_plr.play("Global/fade")
	
func _timeout():
	get_tree().change_scene_to_file("res://scenes/front_origin.tscn")
