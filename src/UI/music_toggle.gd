extends Button


func _on_pressed():
	GlobalSignals.emit_signal("toggle_music")
