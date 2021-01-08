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


func _on_MultimediaScreen_song_data_changed(title, length):
	$MasterHBox/VBoxMiddle/SongTitle/Label.text  = title
	var minutes = int(length) / 60
	var seconds = int(length) - minutes * 60
	
	var song_length = str(minutes) + ":" + str(seconds)
	
	$MasterHBox/VBoxMiddle/SongProgress/VBoxContainer/HBoxContainer2/SongEnd.text = song_length
	$MasterHBox/VBoxMiddle/SongProgress/VBoxContainer/HBoxContainer/ProgressBar.max_value = int(length)
	$MasterHBox/VBoxMiddle/SongProgress/VBoxContainer/HBoxContainer/ProgressBar.value = 0
	
