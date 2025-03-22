extends StaticBody2D



@onready var collision_shape = $CollisionShape2D
@onready var Sprite = $Sprite2D

func _ready():
	toggle_collision()  # Starte die Wiederholung
	toggle_visibility()

func toggle_collision():
	collision_shape.disabled = !collision_shape.disabled  # Umschalten
	get_tree().create_timer(2.0).timeout.connect(toggle_collision)  # Wiederholen

func toggle_visibility():
	Sprite.visible = !Sprite.visible
	get_tree().create_timer(2.0).timeout.connect(toggle_visibility)
