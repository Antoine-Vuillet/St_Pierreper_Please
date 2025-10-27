extends Sinner

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(timeline,"book0")
	await Dialogic.timeline_started


func _process(delta: float) -> void:
	pass
