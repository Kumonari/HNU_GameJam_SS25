extends Node2D

#Dateipfad des nächsten Level
@export_file("*.tscn") var scenePath

#Lädt nächste Szene wenn Player den LevelExit berührt
func loadNextLevel(body):
	print(body)
	var player:MainCharacter = body as MainCharacter
	if player != null:
		get_tree().call_deferred("change_scene_to_file", scenePath)
