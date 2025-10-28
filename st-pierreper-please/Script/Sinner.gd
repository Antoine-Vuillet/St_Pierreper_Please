extends Node

class_name Sinner

@export var mortal_name : String
@export var character_resource : String
@export var firstClue : PackedScene
@export var secondClue : PackedScene
@export var thirdClue : PackedScene
@export var fourthClue : PackedScene
@export var fifthClue : PackedScene

var clue_list: Array
var sinnerpos
var current_diag

enum Morality {  
	EVIL,
	GOOD
}

@export var virtue : Morality

@export var timeline: String

#@export var clue_list: Array[Clue]


func _ready() -> void:
	clue_list = [firstClue, secondClue, thirdClue, fourthClue, fifthClue]
	
func initialize(sinnermarker):
	sinnerpos =sinnermarker
	current_diag =Dialogic.start(timeline,"book0")
	current_diag.register_character(load(character_resource), sinnerpos)


func getName():
	return mortal_name
	
func getVirtue():
	return virtue

func getTimeline():
	return timeline
	
func getClueList():
	return clue_list
	
func startTimeline(book):
	current_diag =Dialogic.start(timeline, book)
	current_diag.register_character(load(character_resource), sinnerpos)

func _on_timeline_event(event_name: String, _args):
	if event_name == "change_to_Pierre":
		current_diag.bubble_style = "res://Dialogic/Bubbles/whisper_bubble.tres"
	elif event_name == "change_to_sinner":
		current_diag.bubble_style = "res://Dialogic/Bubbles/whisper_bubble.tres"
