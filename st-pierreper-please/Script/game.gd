extends CanvasLayer


@onready var gamegame = load("uid://drabf8nw3ysjw") #k
@export var godCharacter: DialogicCharacter
@export var pierreCharacter: DialogicCharacter

const priest = preload("uid://bykbjimlc2fe4")
const hunter = preload("uid://ff1kipdb35ut")
const clown = preload("uid://b6h0nubpml37x")
const kid = preload("uid://s37gh0fpyg85")
const prostitute = preload("uid://dq1f5mv2e7yn0")

const rapper = preload("uid://bqwodvujmeia7")
const nurse = preload("uid://btopfehf6myru")
const granpa = preload("uid://bl6blkskc5bx1")
const medium = preload("uid://jopomhji2avf")
const skinhead = preload("uid://d2cxw0e0ubs3u")

const cursor_hand = preload("uid://c0v0h3v2u6on5")
#const papper = preload("res://Script/paper_info.gd")

var sinnerListScene: Array = [priest, hunter, clown, kid, prostitute, rapper, nurse, granpa, medium, skinhead]
var list5randomSinners: Array

var currentSinnerIndex = 0
var currentSinner
var cluesPosList: Array
var clueList: Array
var clueInspectedIndexList: Array

#@export var currentSinner: Node  #ouais pas ouf
@export var godTimeline: String
@export var energyCount: int

var energy
var start = false
var canClick = true
var isGodTalking = true
var playerErrorCount = 0
var game_finished = false
var inDialogue = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.connect("event_triggered", Callable(self, "_on_event_triggered"))
	
	energy = energyCount
	
	cluesPosList.append($Object1.position)
	cluesPosList.append($Object2.position)
	cluesPosList.append($Object3.position)
	cluesPosList.append($Object4.position)
	cluesPosList.append($Object5.position)
	
	sinnerListScene.shuffle()
	list5randomSinners = sinnerListScene.slice(0, 5)
	
	# first dialog with god
	Dialogic.timeline_ended.connect(_on_diag_finished)
	Dialogic.timeline_started.connect(_on_timeline_started)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	var godDiag = Dialogic.start(godTimeline,"book6")
	godDiag.register_character(godCharacter, $SinnerMarker)
	godDiag.register_character(pierreCharacter, $PierreMarker)

func _process(delta):
	if Input.is_action_just_pressed("dialogic_default_action"):
		canClick = false
		$TimerClick.start()
		if inDialogue:
			$textClickSound.play()

func initSinner():
	if currentSinner:
		currentSinner.queue_free()
	currentSinner = list5randomSinners[currentSinnerIndex].instantiate()
	currentSinner.initialize($SinnerMarker, $PierreMarker)
	
	add_child(currentSinner)
	currentSinner.get_node("Sprite2D").z_index = -1

	for clue in clueList:
		clue.queue_free()
	clueList.clear()
	for i in range(currentSinner.clue_list.size()):
		var clue = currentSinner.clue_list[i].instantiate()
		
		clue.position = cluesPosList[i] - clue.get_size() * clue.get_scale() / 2
		clue.connect("gui_input", Callable(self, "_on_clue_gui_input").bind(i))
		clue.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
		clue.connect("mouse_exited", Callable(self, "_on_mouse_exited"))
		
		clueList.append(clue)
		add_child(clue)

func nextSinner():
	energy = energyCount
	clueInspectedIndexList.clear()
	$p_on_1.visible = true
	$p_on_2.visible = true
	$p_on_3.visible = true
	$p_off_1.visible = false
	$p_off_2.visible = false
	$p_off_3.visible = false
	currentSinnerIndex += 1
	if currentSinnerIndex < list5randomSinners.size():
		initSinner()
	else:
		endGame()

func endGame():
	Dialogic.timeline_ended.connect(_on_game_finished)
	var godDiag = Dialogic.start(godTimeline,"book" + str(playerErrorCount))
	godDiag.register_character(godCharacter, $SinnerMarker)
	godDiag.register_character(pierreCharacter, $PierreMarker)

func _on_timeline_started():
	inDialogue = true

func _on_timeline_ended():
	inDialogue = false

func _on_diag_finished():
	if isGodTalking:
		isGodTalking = false
		initSinner()
	else:
		if energy == 0:
			energy = -1
			currentSinner.startTimeline("book6")

func _on_game_finished():
	game_finished = true
	#get_tree().quit()
	get_tree().change_scene_to_packed(gamegame)

func _on_hell_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print(currentSinner.virtue)
		if currentSinner.virtue == 1: # 0 = EVIL
			playerErrorCount += 1
		nextSinner()
		


func _on_paradise_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print(currentSinner.virtue)
		if currentSinner.virtue == 0: # 1 = GOOD
			playerErrorCount += 1
		nextSinner()
		


func _on_clue_gui_input(event: InputEvent, clueIndex: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed && canClick:
		if clueIndex in clueInspectedIndexList:
			print("object already clicked")
			canClick = false
			var book = "book" + str(clueIndex+1)
			currentSinner.startTimeline(book)
			canClick = true
		elif energy > 0:
			print("new object click")
			canClick = false
			energy -= 1
			if energy == 2:
				$p_on_3.visible = false
				$p_off_3.visible = true
			elif energy == 1:
				$p_on_2.visible = false
				$p_off_2.visible = true
			elif energy == 0:
				$p_on_1.visible = false
				$p_off_1.visible = true
			if clueIndex not in clueInspectedIndexList:
				clueInspectedIndexList.append(clueIndex)
			var book = "book" + str(clueIndex+1)
			currentSinner.startTimeline(book)
			canClick = true
		else:
			var godDiag = Dialogic.start(godTimeline,"book7")
			godDiag.register_character(godCharacter, $SinnerMarker)
			godDiag.register_character(pierreCharacter, $PierreMarker)


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

func _on_event_triggered(event_data):
	if event_data.get("event_type") == "Text":
		if event_data.get("state") == "finished":
			$textClickSound.play()


func _on_timer_click_timeout() -> void:
	canClick = true
