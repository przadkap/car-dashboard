extends PanelContainer


func _ready():
	pass # Replace with function body.



func _on_ProgressTimer_timeout():
	$VBoxContainer/HBoxContainer/ProgressBar.value += 0.1

func _on_MusicPlayer_music_toggled(song_stopped):
	if song_stopped:
		$ProgressTimer.stop()
	else:
		$ProgressTimer.start()
