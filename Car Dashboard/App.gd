extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_key_input(event):
	if(event.pressed and event.scancode == KEY_0):
		$Camera.position.x = int(get_viewport_rect().size.x * 1.5)
	elif(event.pressed and event.scancode == KEY_1):
		$Camera.position.x = int(get_viewport_rect().size.x * 0.5)

