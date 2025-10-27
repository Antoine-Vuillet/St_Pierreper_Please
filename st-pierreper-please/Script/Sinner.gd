extends Node

class_name Sinner

@export var mortal_name : String

enum Morality {  
	EVIL,
	GOOD
}

@export var virtue : Morality

@export var timeline: String

@export var clue_list: Array[Clue]

func getName():
	return mortal_name
	
func getVirtue():
	return virtue

func getTimeline():
	return timeline
	
func getClueList():
	return clue_list
