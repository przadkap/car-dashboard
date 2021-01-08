extends PanelContainer

signal music_toggle

func _ready():
	pass # Replace with function body.


func _on_PlayPause_pressed():
	emit_signal("music_toggle")

