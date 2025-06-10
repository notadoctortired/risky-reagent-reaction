extends Control

func _ready():
	$Transition.visible = true
	$Transition/AnimationPlayer.play("Global/fade in")
