extends Button


var animation_progress = 0
var contact_name = ""

func _ready():
	pass # Replace with function body.


func _on_Timer_timeout():
#	animation_progress = (animation_progress + 1) % 4
#	text = "Calling " + contact_name
#	for _dot in range(0, animation_progress):
#		text += "."
	animation_progress = (animation_progress + 1) % 4
	text = "Calling"
	for _dot in range(0, animation_progress):
		text += "."

func _toggled(button_pressed):
	if not(button_pressed):
		text = "Call"
	else:
		animation_progress = 0
		text = "Calling"
