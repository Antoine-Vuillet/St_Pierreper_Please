extends Control

@onready var game = preload("uid://drabf8nw3ysjw")

func load_scene():
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(game)
