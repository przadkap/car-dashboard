extends PanelContainer



func _ready():
	pass # Replace with function body.




func _on_Accelerometer_speed_changed(new_speed):
	$HBoxContainer/Speed.text = str(int(new_speed))
