extends Node

class_name Sinner

@export var mortal_name : String
@export var firstClue : PackedScene
@export var secondClue : PackedScene
@export var thirdClue : PackedScene
@export var fourthClue : PackedScene
@export var fifthClue : PackedScene

var clue_list: Array;

enum Morality {  
	EVIL,
	GOOD
}

@export var virtue : Morality

@export var timeline: String

#@export var clue_list: Array[Clue]


func _ready() -> void:
	clue_list = [firstClue, secondClue, thirdClue, fourthClue, fifthClue]
	Dialogic.start(timeline,"book0")
	await Dialogic.timeline_started
	
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
	dialogue.register_character() #il y a une erreur avant que je modifie .K
	
