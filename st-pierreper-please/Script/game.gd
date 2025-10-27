extends CanvasLayer

const firstSin = preload("res://Scenes/Sinners/FirstSin.tscn")
const secondSin = preload("res://Scenes/Sinners/SecondSin.tscn")
const thirdSin = preload("res://Scenes/Sinners/ThirdSin.tscn")
const fourthSin = preload("res://Scenes/Sinners/FourthSin.tscn")
const fifthSin = preload("res://Scenes/Sinners/FifthSin.tscn")

var sinnerList: Array = [firstSin, secondSin, thirdSin, fourthSin, fifthSin]
var currentSinnerIndex = 0
var currentSinnerInstance

var start = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentSinnerInstance = sinnerList[0].instantiate()
	#add_child(currentSinnerInstance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func nextSinner():
	currentSinnerIndex += 1
	currentSinnerInstance = sinnerList[currentSinnerIndex].instantiate()
	#add_child(currentSinnerInstance)
	currentSinnerInstance.sinnerImagePosition = Vector2(100, 100)
	currentSinnerInstance.ObjectsImagePosition = [Vector2(50, 200), Vector2(150, 200), Vector2(100, 250), Vector2(50, 300), Vector2(150, 300)]
	pass

func _on_hell_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Clic sur Hell")


func _on_paradise_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("Clic sur Paradise")
