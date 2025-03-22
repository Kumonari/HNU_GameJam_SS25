class_name TitleScreen
extends Control


var main_scene_path = "res://scenes/game/main_scene.tscn"


func _on_start_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", main_scene_path)


func _on_quit_pressed() -> void:
	get_tree().quit()
