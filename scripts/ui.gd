extends Control

@onready var Health1 = $Leben1
@onready var Health2 = $Leben2
@onready var Health3 = $Leben3
@onready var player: MainCharacter = $"../CharacterBody2D"


func _process(delta):
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
		
		await get_tree().create_timer(1.0).timeout
		get_tree().quit()
