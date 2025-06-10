extends Button

var anim_plr = ""

func _ready():
	anim_plr = get_parent().get_node("tr")
	pressed.connect(_button_pressed)
	
	$Timer.timeout.connect()
	
func _button_pressed():
	$Timer.start()
	
	
func _timeout():
	
