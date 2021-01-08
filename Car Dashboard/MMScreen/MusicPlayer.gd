extends PanelContainer

signal music_toggle
signal switch_song

func _ready():
	pass # Replace with function body.


func _on_PlayPause_pressed():
	emit_signal("music_toggle")


func _on_PreviousSong_pressed():
	emit_signal("switch_song", -1)


func _on_NextSong_pressed():
	emit_signal("switch_song", 1)
