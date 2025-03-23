extends Area2D

@export var damage_value: int = 1

func damage(body):
	var player:MainCharacter = body as MainCharacter
	if player != null:
		player.damage(damage_value)
