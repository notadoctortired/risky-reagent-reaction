extends Button

var transition = ""
var anim = ""

func _ready():
	transition = get_parent().get_node("Transition")
	anim = get_parent().get_node("Transition/AnimationPlayer")
	pressed.connect(_button_pressed)
	
	$Timer.timeout.connect(_timeout)
	
func _button_pressed():
	anim.play("fade")
	$Timer.start()

func _timeout():
	get_tree().change_scene_to_file("res://scenes/main_menu_origin.tscn")
	
