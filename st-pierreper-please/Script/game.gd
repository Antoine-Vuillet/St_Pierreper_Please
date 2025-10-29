extends CanvasLayer

const priest = preload("uid://bykbjimlc2fe4")
const hunter = preload("uid://ff1kipdb35ut")
const clown = preload("uid://b6h0nubpml37x")
const kid = preload("uid://s37gh0fpyg85")
const prostitute = preload("uid://dq1f5mv2e7yn0")
const cursor_hand = preload("uid://c0v0h3v2u6on5")
#const papper = preload("res://Script/paper_info.gd")
const sinnerListScene: Array = [priest, hunter, clown, kid, prostitute]

const sinnerPos = Vector2(500, 100)

var currentSinnerIndex = 0
var currentSinner
var cluesPosList: Array
var clueList: Array

#@export var currentSinner: Node  #ouais pas ouf


var start = false
var canClick = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cluesPosList.append($Object1.position)
	cluesPosList.append($Object2.position)
	cluesPosList.append($Object3.position)
	cluesPosList.append($Object4.position)
	cluesPosList.append($Object5.position)
	initSinner()


func initSinner():
	if currentSinner:
		currentSinner.queue_free()
	currentSinner = sinnerListScene[currentSinnerIndex].instantiate()
	currentSinner.initialize($Character/SinnerMarker, $Character/PierreMarker)
	
	add_child(currentSinner)
	currentSinner.get_node("Sprite2D").z_index = -1

	for clue in clueList:
		clue.queue_free()
	clueList.clear()
	for i in range(currentSinner.clue_list.size()):
		var clue = currentSinner.clue_list[i].instantiate()
		
		clue.position = cluesPosList[i] - clue.get_size() * clue.get_scale() / 2
		clue.connect("gui_input", Callable(self, "_on_clue_gui_input").bind(i))
		clue.connect("mouse_entered", Callable(self, "_on_clue_mouse_entered").bind(clue))
		clue.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
		clue.connect("mouse_exited", Callable(self, "_on_clue_mouse_exited"))
		clue.connect("mouse_exited", Callable(self, "_on_mouse_exited"))
		
		clueList.append(clue)
		add_child(clue)

func nextSinner():
	currentSinnerIndex += 1
	initSinner()


func _on_hell_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		nextSinner()


func _on_paradise_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		nextSinner()


func _on_clue_gui_input(event: InputEvent, clueIndex: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed && canClick:
		canClick = false
		print("object" + str(clueIndex+1))
		var book = "book" + str(clueIndex+1)
		currentSinner.startTimeline(book)
		canClick = true


func _on_mouse_entered():
	Input.set_custom_mouse_cursor(cursor_hand)

func _on_mouse_exited():
	Input.set_custom_mouse_cursor(null)


func _on_info_paper_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		 # Replace with function body.
		
		
		var paper_scene = load("res://Scenes/paper_info.tscn")
		var paper_instance = paper_scene.instantiate()
		add_child(paper_instance)  # pour l’afficher
		
		
		var sprite_texture = currentSinner.get_node("Sprite2D").texture

		paper_instance.receive_data(currentSinner.name_s, currentSinner.age_s, currentSinner.sexe_s, currentSinner.metier_s, currentSinner.famille_s, currentSinner.cause_mort_s, sprite_texture)
		
		
		## il me faut le spirite2D de currentSinner 
		
		
	
		#papper.receive_data(currentSinner.name_s)
		#print(currentSinner.name_s)


func _on_hell_mouse_entered() -> void:
	$HellLight.visible = true


func _on_hell_mouse_exited() -> void:
	$HellLight.visible = false


func _on_paradise_mouse_entered() -> void:
	$ParadiseLight.visible = true


func _on_paradise_mouse_exited() -> void:
	$ParadiseLight.visible = false
