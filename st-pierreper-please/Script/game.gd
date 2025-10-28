extends CanvasLayer

const priest = preload("uid://bykbjimlc2fe4")
const hunter = preload("uid://ff1kipdb35ut")
const clown = preload("uid://b6h0nubpml37x")
const kid = preload("uid://s37gh0fpyg85")
const prostitute = preload("uid://dq1f5mv2e7yn0")
const cursor_hand = preload("uid://c0v0h3v2u6on5")
const sinnerListScene: Array = [priest, hunter, clown, kid, prostitute]

const sinnerPos = Vector2(500, 100)
const cluesPosList = [Vector2(450, 390), Vector2(900, 390), Vector2(680, 450), Vector2(450, 510), Vector2(900, 510)]

var currentSinnerIndex = 0
var currentSinner
var tooltip

#@export var currentSinner: Node  #ouais pas ouf


var start = false
var canClick = true
var isHovering = false
var hoverTime = 0.0
var lastMousePos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initSinner()
	tooltip = $tooltip
	move_child(tooltip, get_child_count() - 1)
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.1, 0.1, 0.1, 0.5)
	style.set_corner_radius_all(8)
	tooltip.add_theme_stylebox_override("panel", style)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isHovering:
		var currentMousePos = get_viewport().get_mouse_position()
		if currentMousePos.distance_to(lastMousePos) > 1:
			hoverTime = 0.0
			lastMousePos = currentMousePos
			tooltip.visible = false
		else:
			hoverTime += delta
			if hoverTime >= 1.0:
				tooltip.visible = true
				tooltip.position = lastMousePos + Vector2(10, -20)

func initSinner():
	if currentSinner:
		currentSinner.queue_free()
	currentSinner = sinnerListScene[currentSinnerIndex].instantiate()
	currentSinner.initialize($Character/SinnerMarker, $Character/PierreMarker)
	add_child(currentSinner)
	
	for i in range(currentSinner.clue_list.size()):
		var clue = currentSinner.clue_list[i].instantiate()
		add_child(clue)
		clue.position = cluesPosList[i]
		clue.connect("gui_input", Callable(self, "_on_clue_gui_input").bind(i))
		clue.connect("mouse_entered", Callable(self, "_on_clue_mouse_entered").bind(clue))
		clue.connect("mouse_exited", Callable(self, "_on_clue_mouse_exited"))

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

func _on_mouse_entered():
	Input.set_custom_mouse_cursor(cursor_hand)

func _on_mouse_exited():
	Input.set_custom_mouse_cursor(null)


func _on_clue_mouse_entered(clue: Control):
	isHovering = true
	hoverTime = 0.0
	tooltip.get_node("tooltipLabel").text = clue.title
	tooltip.custom_minimum_size = Vector2.ZERO
	tooltip.queue_sort()
	lastMousePos = get_viewport().get_mouse_position()
	#Input.set_custom_mouse_cursor(cursor_hand)

func _on_clue_mouse_exited():
	isHovering = false
	tooltip.visible = false
	#Input.set_custom_mouse_cursor(null)
