extends Control

@onready var menu = load("res://Scenes/main_menu/main_menu.tscn")

func load_scene():
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(menu)
