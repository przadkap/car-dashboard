extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_speed = 0
var speed_function_arg = 0 # values from 0 to 1336
# speed equation y = (25*log(base=1.5, value=0.05*(x+20))
# max speed 260 at x = 1336.37

signal speed_changed

var accelerating = false
var braking = false
# Called when the node enters the scene tree for the first time.
func _ready():
	load_segment_styleboxes()
	pass # Replace with function body.


func load_segment_styleboxes():
	for segment in get_children():
		var level_no = segment.get_index() + 1
		var path = "res://styleboxes/level-%s.tres"
		var level_stylebox = load(path % str(level_no))
		segment.add_stylebox_override("fg", level_stylebox)

# Called every frame. 'delta' is the elapsed time since the previous frame.

func speed_changed(new_speed):
	current_speed = new_speed
	for segment in get_children():
		if new_speed > (segment.get_index() + 1) * 20:
			segment.value = 20
		elif ((segment.get_index() + 1) * 20) - new_speed < 20:
			segment.value = new_speed -  (segment.get_index() * 20)
		else:
			 segment.value = 0
	emit_signal("speed_changed", new_speed)


func _on_Accelerate_pressed():
#	speed_changed(current_speed + 5)
	accelerating = true


func _on_Decelerate_pressed():
#	speed_changed(current_speed - 5)
	accelerating = false
#	braking = true


func _on_SpeedCheck_timeout():
	if accelerating:
		if(current_speed < 260):
			speed_function_arg += 1
	elif braking:
		if(current_speed > 0):
			speed_function_arg -= 1
	else:
		if(current_speed > 0):
			speed_function_arg -= 0.5
	
	speed_changed(stepify(compute_speed(speed_function_arg), 0.001))
	
	
	
func compute_speed(x):
	return 25 * (log(0.05 * (x + 20)) / log(1.5))
	
	
	
	
	
