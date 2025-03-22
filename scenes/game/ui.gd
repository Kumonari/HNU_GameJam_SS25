extends Control

@onready var Health1 = $Leben1
@onready var Health2 = $Leben2
@onready var Health3 = $Leben3

func _ready() -> void:
	Health_Screen()

func Health_Screen():
	if player.health == 3:
		Health1.visible = true
		Health2.visible = true
		Health3.visible = true
	if player.health == 2:
		Health1.visible = true
		Health2.visible = true
		Health3.visible = false
	if player.health == 1:
		Health1.visible = true
		Health2.visible = false
		Health3.visible = false
