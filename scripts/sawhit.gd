extends Area2D

@export var damage_value: int = 1

func damage(body):
	var player:MainCharacter = body as MainCharacter
	if player != null:
		player.damage(damage_value)


func _on_area_entered(area: Area2D) -> void:
	var hand:Hand = area as Hand
	if hand != null:
		hand.damage(damage_value)
