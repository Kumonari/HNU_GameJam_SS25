class_name EndScreen
extends Control

@onready var label: Label = $TextureRect/MarginContainer/VBoxContainer/Label
@export_file("*.tscn") var scenePath

func _ready() -> void:
	pass


func _on_play_again_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", scenePath)


func _on_quit_pressed() -> void:
	get_tree().quit()
