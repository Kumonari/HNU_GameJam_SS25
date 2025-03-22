extends Label


var time_elapsed: float = 0.0  # Gesamtzeit
var running: bool = true  # Falls du den Timer pausieren möchtest

func _process(delta):
	if running:
		time_elapsed += delta  # Zeit hochzählen
		var minutes = int(time_elapsed) / 60
		var seconds = int(time_elapsed) % 60
		var milliseconds = int((time_elapsed - int(time_elapsed)) * 1000)
		text = "%02d:%02d:%03d" % [minutes, seconds, milliseconds]  
