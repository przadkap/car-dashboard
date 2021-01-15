extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scenes 


var current_scene_name = "gps"

# Called when the node enters the scene tree for the first time.
func _ready():
	scenes = {
		"gps": $GPS,
		"music": $MusicPlayer,
		"phone": $Phone,
	}

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MultimediaScreen_content_changed(scene_name):
	if current_scene_name == scene_name:
		return
	
	scenes[current_scene_name].hide()
	scenes[scene_name].show()
	
	current_scene_name = scene_name
