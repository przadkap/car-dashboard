extends PanelContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tile_stylebox = preload("res://MMScreen/styleboxes/multimedia_tiles.tres")
var selected_stylebox = preload("res://MMScreen/styleboxes/multimedia_sidebar.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_stylebox_override("panel", selected_stylebox)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
