extends Area2D

var origin = ""

func _ready():
	origin = get_parent().get_parent()
	if origin.name == "front_origin":
		origin.get_node("Explosion/Timer").timeout.connect(_timeout)

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int):
	if event is InputEventMouseButton \
	and event.button_index == MOUSE_BUTTON_LEFT \
	and event.is_pressed():
		self._on_click()
		
func _on_click():
	var content = _load_from_file()
	
	if content == "Red Flask" and get_parent().name == "Green Flask" \
	or content == "Green Flask" and get_parent().name == "Red Flask":
		origin.get_node("Explosion").visible = true
		origin.get_node("Explosion/AnimationPlayer").play("explosion")
		origin.get_node("Explosion/Timer").start()
	
	if content == "Purple Flask" and get_parent().name == "Blue Flask" \
	or content == "Blue Flask" and get_parent().name == "Purple Flask":
		origin.get_node("Purple_Filter").visible = true
	
	if content == "Red Flask" and get_parent().name == "Bunny":
		print("Bunny!!!")
		
	
	if content != get_parent().name:
		_save_to_file(get_parent().name)

func _timeout():
	get_tree().quit()
	
func _save_to_file(content):
	var file = FileAccess.open("res://scripts/reactions/current_flask.txt", FileAccess.WRITE)
	file.store_string(content)
	var label = get_parent().get_parent().get_node("Selection_Label")
	if origin.name == "front_origin":
		label.text = str("Selected: " + content)
	
func _load_from_file():
	var file = FileAccess.open("res://scripts/reactions/current_flask.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
