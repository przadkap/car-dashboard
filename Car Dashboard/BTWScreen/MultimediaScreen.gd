extends Control

var song_info = [
	{"title": "All That", "path": "res://music/allthat.ogg"},
	{"title": "Dance", "path": "res://music/dance.ogg"},
	{"title": "E.R.F.", "path": "res://music/erf.ogg"},
	{"title": "Hip Jazz", "path": "res://music/hipjazz.ogg"},
	{"title": "Sexy", "path": "res://music/sexy.ogg"},
]

var songs = []
var current_song_index = 0

signal song_data_changed
signal music_toggled
signal content_changed

func _ready():
	for song in song_info:
		songs.append({"title": song["title"], "stream": load(song["path"])})
	$MusicAudio.stream = songs[current_song_index]["stream"]
	emit_signal("song_data_changed", songs[current_song_index]["title"], songs[current_song_index]["stream"].get_length())


func _on_MusicPlayer_music_toggle():
	if $MusicAudio.playing:
		if $MusicAudio.stream_paused:
			$MusicAudio.stream_paused = false
		else:
			$MusicAudio.stream_paused = true
	else:
		$MusicAudio.playing = true
		$MusicAudio.stream_paused = false
	emit_signal("music_toggled", $MusicAudio.stream_paused)


func _on_MusicPlayer_switch_song(index_offset):
	current_song_index += index_offset

	if current_song_index >= len(songs):
		current_song_index = 0
	elif current_song_index < 0:
		current_song_index = len(songs) - 1
	
	print_debug(current_song_index)
	print_debug(songs[current_song_index]["title"])
	
	Globals.manual_song_change = true
	
	$MusicAudio.stream = songs[current_song_index]["stream"]
	emit_signal("song_data_changed", songs[current_song_index]["title"], songs[current_song_index]["stream"].get_length())
	
	if ($MusicAudio.playing || !$MusicAudio.stream_paused):
		$MusicAudio.play()



func _on_MusicAudio_finished():
	if(Globals.manual_song_change):
		Globals.manual_song_change = false
		return
	
	print_debug(Globals.manual_song_change)
	print_debug("finished")

	current_song_index += 1

	if current_song_index >= len(songs):
		current_song_index = 0
	elif current_song_index < 0:
		current_song_index = len(songs) - 1
		
	emit_signal("song_data_changed", songs[current_song_index]["title"], songs[current_song_index]["stream"].get_length())
	$MusicAudio.stream = songs[current_song_index]["stream"]
	$MusicAudio.play()


func _on_Phone_call_toggled(calling):
	if(calling && !$MusicAudio.stream_paused):
		$MusicAudio.stream_paused = true
	else:
#		$MusicAudio.stream_paused = false
		pass


func _on_GPS_pressed():
	emit_signal("content_changed", "music")


func _on_Music_pressed():
	emit_signal("content_changed", "music")


func _on_Settings_pressed():
	pass # Replace with function body.


func _on_Phone_pressed():
	emit_signal("content_changed", "phone")


func _on_Statistics_pressed():
	pass # Replace with function body.
