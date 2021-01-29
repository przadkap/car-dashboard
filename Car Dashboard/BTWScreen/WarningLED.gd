extends PanelContainer

var texture_on = preload("res://images/led_warning_on.png")
var texture_off = preload("res://images/led_warning_off.png")

var led_on = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BlinkTimer_timeout():
	led_on = !led_on
	if(led_on):
		$LED.texture = texture_on
	else:
		$LED.texture = texture_off
		

func reset_texture():
	$LED.texture = texture_off
