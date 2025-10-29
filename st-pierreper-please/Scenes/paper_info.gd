extends CanvasLayer

@onready var name_sinner: Label = $Paper/VBoxContainer/Label_name/Name
@onready var age_sinner: Label = $Paper/VBoxContainer/Label_age/Age
@onready var sexe_sinner: Label = $Paper/VBoxContainer/Label_sexe/Sexe
@onready var metier_sinner: Label = $"Paper/VBoxContainer/Label_métier/Metier"
@onready var famille_sinner: Label = $Paper/VBoxContainer/Label_famille/Famille
@onready var cause_mort_sinner: Label = $"Paper/VBoxContainer/Label_cause/Cause mort"

@onready var game = preload("uid://dwog1r6ydfcne") 


##
@export var texture : PackedScene
##

func receive_data(name, age, sexe, metier, famille, cause_mort, sprite_texture):
	#print(name)
	name_sinner.text=name
	age_sinner.text= age
	sexe_sinner.text= sexe
	metier_sinner.text= metier
	famille_sinner.text= famille
	cause_mort_sinner.text= cause_mort
	#var sprite = $Paper/ProfilePicture/Sprite2D
	#sprite.region_enabled = true
	#sprite.region_rect = Rect2(Vector2(50, 50), Vector2(128, 128))

	$Paper/ProfilePicture/Sprite2D.texture= sprite_texture
	$Paper/ProfilePicture/Sprite2D.scale = Vector2(0.15, 0.15)
	
func _ready():
	pass
	#name_sinner.text="hello"
	#name_sinner.text = GameManager.currentSinner.name_s
	#age_sinner.text= GameManager.currentSinner.age_s
	#sexe_sinner.text= GameManager.currentSinner.sexe_s
	#metier_sinner.text= GameManager.currentSinner.metier_s
	#famille_sinner.text= GameManager.currentSinner.famille_s
	#cause_mort_sinner.text= GameManager.currentSinner.cause_mort_s
	




#extends CanvasLayer

#@onready var character = $Character
#@onready var name_sinner: Label = $Paper/Name
#var MyScript = load("res://Script/game.gd")
#var personnage = MyScript
#var Sinner = preload("res://Script/game.gd").new()
#@onready var info = Sinner  
#var namee= 

#print(personnage.nom)


#var points = 0

#func _ready():
	#print(personnage.currentsinner)
	#print("Points : " + str(points))

#func _ready():
#	var main_scene = "res://Scenes/game.tscn"  # ou le bon chemin exact
#	var sinner = main_scene.currentSinner
#	print("Nom du pécheur :", sinner.name_s)
#	$Paper/Name.text = sinner.name_s

#func _process(delta):
	#print(Sinner.currentSinner)
	#name_sinner.text = (Sinner.currentSinner)
	#name_sinner.text = ("Points: " + str(points))
	#name_sinner.text = (personnage.currentsinner)
	#print(Sinner.currentSinner.name)


func _on_color_rect_gui_input(event: InputEvent) -> void:
	#get_tree().current_scene.queue_free()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		queue_free()


	 # Replace with function body.
