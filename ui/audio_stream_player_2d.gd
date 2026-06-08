extends AudioStreamPlayer

@export var soundtrack_playlist: Array[AudioStream]

func _ready() -> void:
	finished.connect(_on_song_finished)
	
	play_random_track()

func play_random_track() -> void:
	if soundtrack_playlist.is_empty():
		return
		
	var next_song = soundtrack_playlist.pick_random()
	
	while stream == next_song and soundtrack_playlist.size() > 1:
		next_song = soundtrack_playlist.pick_random()
		
	stream = next_song
	play()

func _on_song_finished() -> void:
	play_random_track()
