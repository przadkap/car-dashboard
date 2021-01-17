extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal turn_left
signal turn_right
signal turn_off

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_key_input(event):
	if(event.pressed and event.scancode == KEY_0):
		$Camera.position.x = int(get_viewport_rect().size.x * 1.5)
	elif(event.pressed and event.scancode == KEY_1):
		$Camera.position.x = int(get_viewport_rect().size.x * 0.5)
	elif(event.pressed and event.scancode == KEY_RIGHT):
		emit_signal("turn_right")
	elif(event.pressed and event.scancode == KEY_LEFT):
		emit_signal("turn_left")
	elif(event.pressed and event.scancode == KEY_UP):
		emit_signal("turn_off")


func _on_KMTimer_timeout():
	Globals.distance_traveled["day"] += 1
	Globals.distance_traveled["week"] += 1
	Globals.distance_traveled["month"] += 1
	print(Globals.distance_traveled["day"])
	print(Globals.distance_traveled["week"])
	print(Globals.distance_traveled["month"])


func _on_Accelerometer_accelerate_start():
	$BTWScreen/KMTimer.start()


func _on_StopDistanceTimer_timeout():
	$BTWScreen/KMTimer.stop()


func _on_Accelerometer_accelerate_stop():
	$BTWScreen/StopDistanceTimer.start()
