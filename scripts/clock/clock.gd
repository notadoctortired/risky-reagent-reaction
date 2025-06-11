extends Label

var ending = false
var teacher = ""

func _ready():
	teacher = get_parent().get_node("Teacher")
	$Timer.timeout.connect(_timeout)
	var content = _load_from_file()
	if content == "":
		$Timer.start(5)
	elif content != "" and ending == false:
		$Timer.start(int(content))

func _process(delta):
	if ending == false:
		text = str(int(round($Timer.time_left)))
		_save_to_file(text)
	
	
func _timeout():
	if ending == true:
		get_tree().exit()
	
	ending = true
	teacher.visible = true
	teacher.get_node("AnimationPlayer").play("Global/ladirt")
	$Timer.start(5)
	
func _save_to_file(content):
	var file = FileAccess.open("res://scripts/clock/time_left.txt", FileAccess.WRITE)
	file.store_string(content)
	
func _load_from_file():
	var file = FileAccess.open("res://scripts/clock/time_left.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
