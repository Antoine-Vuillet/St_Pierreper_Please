extends CanvasLayer

@onready var name_label: Label = $Paper/Name
@onready var agee: Label = $Paper/Age

func _ready():
	name_label.text = GameManager.currentSinner.name_s
	agee.text= GameManager.currentSinner.age_s




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
