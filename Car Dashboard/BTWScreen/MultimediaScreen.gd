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
		
	emit_signal("song_data_changed", songs[current_song_index]["title"], songs[current_song_index]["stream"].get_length())
	$MusicAudio.stream = songs[current_song_index]["stream"]
	$MusicAudio.play() # only actually plays if the song was playing before for some reason


func _on_MusicAudio_finished():
	current_song_index += 1

	if current_song_index >= len(songs):
		current_song_index = 0
	elif current_song_index < 0:
		current_song_index = len(songs) - 1
		
	emit_signal("song_data_changed", songs[current_song_index]["title"], songs[current_song_index]["stream"].get_length())
	$MusicAudio.stream = songs[current_song_index]["stream"]
	$MusicAudio.play() # only actually plays if the song was playing before for some reason
