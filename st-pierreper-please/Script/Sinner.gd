extends Node

class_name Sinner

@export var mortal_name : String
@export var character_resource : String
@export var pierre_resource : String
@export var firstClue : PackedScene
@export var secondClue : PackedScene
@export var thirdClue : PackedScene
@export var fourthClue : PackedScene
@export var fifthClue : PackedScene


@export var name_s: String
@export var age_s: String
@export var sexe_s: String 
@export var metier_s: String 
@export var famille_s: String 
@export var cause_mort_s: String



var clue_list: Array
var sinnerpos
var pierrepos
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
	
func initialize(sinnermarker, pierremark):
	sinnerpos =sinnermarker
	pierrepos=pierremark
	current_diag =Dialogic.start(timeline,"book0")
	current_diag.register_character(load(character_resource), sinnerpos)
	current_diag.register_character(load(pierre_resource), pierrepos)


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
	current_diag.register_character(load(pierre_resource), pierrepos)
