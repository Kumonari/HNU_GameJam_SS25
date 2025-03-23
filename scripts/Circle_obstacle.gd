extends PathFollow2D


@export var speed: float = 100.0  # Bewegungsgeschwindigkeit

func _ready() -> void:
	$StaticBody2D/CollisionShape2D/AnimatedSprite2D.play("default")

func _process(delta):
	progress += speed * delta 
