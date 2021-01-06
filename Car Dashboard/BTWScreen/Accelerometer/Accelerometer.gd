extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var current_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	speed_changed(300)
	load_segment_styleboxes()
	pass # Replace with function body.


func load_segment_styleboxes():
	for segment in get_children():
		var level_no = segment.get_index() + 1
		var path = "res://styleboxes/level-%s.tres"
		var level_stylebox = load(path % str(level_no))
		segment.add_stylebox_override("fg", level_stylebox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func speed_changed(new_speed):
	current_speed = new_speed
	for segment in get_children():
		if new_speed > (segment.get_index() + 1) * 20:
			segment.value = 20
		elif ((segment.get_index() + 1) * 20) - new_speed < 20:
			segment.value = new_speed -  (segment.get_index() * 20)
		else:
			 segment.value = 0


func _on_Accelerate_pressed():
	speed_changed(current_speed + 5)


func _on_Decelerate_pressed():
	speed_changed(current_speed - 5)
