extends Control
# @onready var first_level = preload("res://level.tscn") 

func _on_start_button_down() -> void:
	pass # Replace with function body.
	# await get_tree().create_timer(1).timeout
	# get_tree().change_scene_to_packed(first_level)


func _on_exit_button_down() -> void:
	get_tree().quit() # Replace with function body.
