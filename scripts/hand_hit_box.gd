class_name Hand
extends Area2D

@onready var player = get_parent().get_parent().get_parent()

func damage(damage):
	player.damage(damage)
