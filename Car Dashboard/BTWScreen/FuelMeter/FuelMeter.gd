extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var meter_levels = [13, 10, 7, 4, 1]

signal fuel_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	load_segment_styleboxes()
	fuel_changed(95)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fuel_changed(new_fuel):
	emit_signal("fuel_changed", new_fuel)
	for segment in get_children():
		print(segment.get_index())
		if new_fuel >= (segment.get_index() + 1) * 20:
			segment.value = 20
		elif ((segment.get_index() + 1) * 20) - new_fuel < 20:
			segment.value = new_fuel -  (segment.get_index() * 20) 
		else:
			 break # not sure if good idea
	



func load_segment_styleboxes():
	for segment in get_children():
		var level_no = meter_levels[segment.get_index()]
		var path = "res://BTWScreen/styleboxes/level-%s.tres"
		var level_stylebox = load(path % str(level_no))
		segment.add_stylebox_override("fg", level_stylebox)
