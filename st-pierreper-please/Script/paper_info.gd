extends CanvasLayer

@onready var name_sinner: Label = $Paper/VBoxContainer/Name
@onready var age_sinner: Label = $Paper/VBoxContainer/Age
@onready var sexe_sinner: Label = $Paper/VBoxContainer/Sexe
@onready var metier_sinner: Label = $Paper/VBoxContainer/Metier
@onready var famille_sinner: Label = $Paper/VBoxContainer/Famille
@onready var cause_mort_sinner: Label = $"Paper/VBoxContainer/Cause mort"

func _ready():
	pass
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
