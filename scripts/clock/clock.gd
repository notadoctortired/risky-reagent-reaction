extends Label

var ending = false

func _ready():
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
	ending = true
	print("Nerd Ending")
	
func _save_to_file(content):
	var file = FileAccess.open("res://scripts/clock/time_left.txt", FileAccess.WRITE)
	file.store_string(content)
	
func _load_from_file():
	var file = FileAccess.open("res://scripts/clock/time_left.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
