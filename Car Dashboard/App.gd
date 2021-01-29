extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal turn_left
signal turn_right
signal turn_off
signal km_changed
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _unhandled_key_input(event):
	if(event.pressed and event.scancode == KEY_2):
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
	emit_signal("km_changed")
	


func _on_Accelerometer_accelerate_start():
	$BTWScreen/KMTimer.start()


func _on_StopDistanceTimer_timeout():
	$BTWScreen/KMTimer.stop()


func _on_Accelerometer_accelerate_stop():
	$BTWScreen/StopDistanceTimer.start()


func _on_EngineButton_toggled(button_pressed):
	if(button_pressed):
		$BTWScreen/LEDs/HBoxContainer/Engine.texture = load("res://images/led_engine_on.png")
	else:
		$BTWScreen/LEDs/HBoxContainer/Engine.texture = load("res://images/led_engine_off.png")
		


func _on_LightButton_toggled(button_pressed):
	if(button_pressed):
		$BTWScreen/LEDs/HBoxContainer/Light.texture = load("res://images/led_lights_on.png")
	else:
		$BTWScreen/LEDs/HBoxContainer/Light.texture = load("res://images/led_lights_off.png")


func _on_OilButton_toggled(button_pressed):
	if(button_pressed):
		$BTWScreen/LEDs/HBoxContainer/Oil.texture = load("res://images/led_oil_on.png")
	else:
		$BTWScreen/LEDs/HBoxContainer/Oil.texture = load("res://images/led_oil_off.png")


func _on_BatteryButton_toggled(button_pressed):
	if(button_pressed):
		$BTWScreen/LEDs/HBoxContainer/Battery.texture = load("res://images/led_battery_on.png")
	else:
		$BTWScreen/LEDs/HBoxContainer/Battery.texture = load("res://images/led_battery_off.png")


func _on_ABSButton_toggled(button_pressed):
	if(button_pressed):
		$BTWScreen/LEDs/HBoxContainer/ABS.texture = load("res://images/led_abs_on.png")
	else:
		$BTWScreen/LEDs/HBoxContainer/ABS.texture = load("res://images/led_abs_off.png")
