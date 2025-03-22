extends PathFollow2D


@export var speed: float = 100.0  # Bewegungsgeschwindigkeit



func _process(delta):
	progress += speed * delta 
