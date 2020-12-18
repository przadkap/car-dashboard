extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rpm_changed(50)
	pass # Replace with function body.


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
			 break # not sure if good idea
	pass
