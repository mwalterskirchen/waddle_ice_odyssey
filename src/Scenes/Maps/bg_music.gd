extends AudioStreamPlayer

var is_music_playing = true

func _ready():
	GlobalSignals.connect("toggle_music", _on_toggle_music)

func _on_toggle_music():
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), !is_music_playing) 
	is_music_playing = !is_music_playing
