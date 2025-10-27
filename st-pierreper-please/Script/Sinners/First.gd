extends Sinner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(timeline,"book1")


func _process(delta: float) -> void:
	pass
