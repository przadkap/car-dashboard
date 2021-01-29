extends PanelContainer

signal music_toggle
signal switch_song
signal music_toggled

var play_texture = preload("res://images/play4.png")
var pause_texture = preload("res://images/pause2.png")

var playing = false

func _ready():
	pass # Replace with function body.


func _on_PlayPause_pressed():
	emit_signal("music_toggle")
	playing = !playing
	if(playing):
		$MasterHBox/VBoxMiddle/PlayPause/PlayPause/TextureRect.texture = pause_texture
	else:
		$MasterHBox/VBoxMiddle/PlayPause/PlayPause/TextureRect.texture = play_texture


func _on_PreviousSong_pressed():
	emit_signal("switch_song", -1)


func _on_NextSong_pressed():
	emit_signal("switch_song", 1)


func _on_MultimediaScreen_song_data_changed(title, length):
	print_debug(title)
	$MasterHBox/VBoxMiddle/SongTitle/Label.text  = title
	var minutes = int(length) / 60
	var seconds = int(length) - minutes * 60
	
	var song_length = str(minutes) + ":" + str(seconds)
	
	$MasterHBox/VBoxMiddle/SongProgress/VBoxContainer/HBoxContainer2/SongEnd.text = song_length
	$MasterHBox/VBoxMiddle/SongProgress/VBoxContainer/HBoxContainer/ProgressBar.max_value = int(length)
	$MasterHBox/VBoxMiddle/SongProgress/VBoxContainer/HBoxContainer/ProgressBar.value = 0
	


func _on_MultimediaScreen_music_toggled(song_stopped):
	emit_signal("music_toggled", song_stopped)

