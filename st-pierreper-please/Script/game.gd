extends CanvasLayer

const priest = preload("uid://bykbjimlc2fe4")
const hunter = preload("uid://ff1kipdb35ut")
const clown = preload("uid://b6h0nubpml37x")
const kid = preload("uid://s37gh0fpyg85")
const prostitute = preload("uid://dq1f5mv2e7yn0")
const sinnerListScene: Array = [priest, hunter, clown, kid, prostitute]

const sinnerPos = Vector2(500, 100)
const cluesPosList = [Vector2(450, 390), Vector2(900, 390), Vector2(680, 450), Vector2(450, 510), Vector2(900, 510)]

var currentSinnerIndex = 0
var currentSinner

#@export var currentSinner: Node  #ouais pas ouf


var start = false
var canClick = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initSinner()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func initSinner():
	if currentSinner:
		currentSinner.queue_free()
	currentSinner = sinnerListScene[currentSinnerIndex].instantiate()
	currentSinner.initialize($Character/SinnerMarker, $Character/PierreMarker)
	add_child(currentSinner)
	GameManager.currentSinner = currentSinner
	
	for i in range(currentSinner.clue_list.size()):
		var clue = currentSinner.clue_list[i].instantiate()
		add_child(clue)
		clue.position = cluesPosList[i]
		clue.connect("gui_input", Callable(self, "_on_clue_gui_input").bind(i))

func nextSinner():
	currentSinnerIndex += 1
	initSinner()

func _on_hell_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Clic sur Hell")


func _on_paradise_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Clic sur Paradise")


func _on_clue_gui_input(event: InputEvent, clueIndex: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed && canClick:
		canClick = false
		print("object" + str(clueIndex+1))
		var book = "book" + str(clueIndex+1)
		currentSinner.startTimeline(book)
		canClick = true
