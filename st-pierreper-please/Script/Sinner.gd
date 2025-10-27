extends Node

class_name Sinner

@export var mortal_name : String
const firstClue = preload("res://Scene/clue/Prêtre/crucifix.tscn")
const secondClue = preload("res://Scene/clue/Prêtre/livre_catéchisme.tscn")
const thirdClue = preload("res://Scene/clue/Prêtre/Smartphone.tscn")
const fourthClue = preload("res://Scene/clue/Prêtre/Règle.tscn")
const fifthClue = preload("res://Scene/clue/Prêtre/Craie.tscn")

var clue_list: Array = [firstClue, secondClue, thirdClue, fourthClue, fifthClue]

enum Morality {  
	EVIL,
	GOOD
}

@export var virtue : Morality

@export var timeline: String

#@export var clue_list: Array[Clue]


func _ready() -> void:
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
	return Dialogic.start(timeline, book)
	await Dialogic.timeline_ended
