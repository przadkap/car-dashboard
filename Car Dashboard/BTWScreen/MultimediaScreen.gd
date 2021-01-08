extends Control

var song_info = [
	{"title": "All That", "path": "res://music/allthat.ogg"},
	{"title": "Dance", "path": "res://music/dance.ogg"},
	{"title": "E.R.F.", "path": "res://music/erf.ogg"},
	{"title": "Hip Jazz", "path": "res://music/hipjazz.ogg"},
	{"title": "Sexy", "path": "res://music/sexy.ogg"},
]

var songs = []

func _ready():
	for song in song_info:
		songs.append({"title": song["title"], "stream": load(song["path"])})
	$MusicAudio.stream = songs[0]["stream"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MusicPlayer_music_toggle():
	if $MusicAudio.playing:
		if $MusicAudio.stream_paused:
			$MusicAudio.stream_paused = false
		else:
			$MusicAudio.stream_paused = true
	else:
		$MusicAudio.playing = true
		$MusicAudio.stream_paused = false

