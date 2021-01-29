extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rpm_func_arg = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	load_segment_styleboxes()
	pass # Replace with function body.

func load_segment_styleboxes():
	for segment in get_children():
		var level_no = segment.get_index() + 1
		var path = "res://BTWScreen/styleboxes/level-%s.tres"
		var level_stylebox = load(path % str(level_no))
		segment.add_stylebox_override("fg", level_stylebox)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func rpm_changed(new_rpm):
	for segment in get_children():
		if new_rpm > (segment.get_index() + 1) * 20:
			segment.value = 20
		elif ((segment.get_index() + 1) * 20) - new_rpm < 20:
			segment.value = new_rpm -  (segment.get_index() * 20)
		else:
			 segment.value = 0
	pass

func _on_Accelerometer_speed_changed(new_speed):
	rpm_changed(new_speed * 0.60)
