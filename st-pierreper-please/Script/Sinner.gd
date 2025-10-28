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
	sinnermarker =sinnermarker
	var dialogue =Dialogic.start(timeline,"book0")
	dialogue.register_character(load(character_resource), sinnermarker)


func getName():
	return mortal_name
	
func getVirtue():
	return virtue

func getTimeline():
	return timeline
	
func getClueList():
	return clue_list
	
func startTimeline(book):
	var dialogue =Dialogic.start(timeline, book)
	dialogue.register_character(load(character_resource), sinnerpos)
