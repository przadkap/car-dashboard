extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	rpmChanged(50)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func rpmChanged(new_speed):
	for segment in get_children():
		if new_speed > segment.get_index() * 20:
			segment.value = 20
		elif (segment.get_index() * 20) - new_speed < 20:
			segment.value = (segment.get_index() * 20) - new_speed
		else:
			 break # not sure if good idea
	pass
