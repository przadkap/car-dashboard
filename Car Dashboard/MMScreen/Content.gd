extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scenes 


var current_scene_name = "none"

# Called when the node enters the scene tree for the first time.
func _ready():
	scenes = {
		"gps": $GPS,
		"music": $MusicPlayer,
		"phone": $Phone,
		"statistics": $Statistics,
		"none": null
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MultimediaScreen_content_changed(scene_name):
	if current_scene_name == scene_name:
		return
	if scenes[current_scene_name] != null:
		scenes[current_scene_name].hide()
	scenes[scene_name].show()
	
	current_scene_name = scene_name
