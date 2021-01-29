extends PanelContainer

func _ready():
	pass # Replace with function body.

func _on_Accelerometer_speed_changed(new_speed):
	if new_speed < 0:
		new_speed = 0
	$HBoxContainer/Speed.text = str(int(new_speed))
