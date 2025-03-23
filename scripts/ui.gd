extends Control

@onready var Health1 = $Leben1
@onready var Health2 = $Leben2
@onready var Health3 = $Leben3
@export var player: MainCharacter


func _process(_delta):
	Health_Screen()

func Health_Screen():
	if player.health == 3:
		Health1.frame = 0
		Health2.frame = 0
		Health3.frame = 0
	if player.health == 2:
		Health1.frame = 0
		Health2.frame = 0
		Health3.frame = 1
	if player.health == 1:
		Health1.frame = 0
		Health2.frame = 1
		Health3.frame = 1
	if player.health == 0:
		Health1.frame = 1
		Health2.frame = 1
		Health3.frame = 1
