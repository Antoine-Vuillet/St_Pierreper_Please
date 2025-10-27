extends Control
@onready var game = preload("res://Scene/game.tscn") 

func _on_start_button_down() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(game)


func _on_exit_button_down() -> void:
	get_tree().quit() # Replace with function body.
