extends Control
@onready var game = preload("uid://dwog1r6ydfcne") 
@onready var credits = preload("uid://caq6304yniqdf") 

func _on_start_button_down() -> void:
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_packed(game)


func _on_exit_button_down() -> void:
	get_tree().quit() # Replace with function body.


func _on_credits_pressed() -> void:
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(credits)
