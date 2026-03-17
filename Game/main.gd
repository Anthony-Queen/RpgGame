extends Node2D
@onready var player = $Player
@onready var ExplanationDialogue = load("res://Dialogues/MainExplanation.dialogue")
@onready var SkeletonDialogue = load("res://Dialogues/Skeleton.dialogue")
@onready var PriestDialogue = load("res://Dialogues/Priest3.dialogue")
@onready var DemoEnd = load("res://Dialogues/DemoEnd.dialogue")

func _ready():
	player.combat_started.connect(Globals.show_battle)
	if Globals.WhichDialogue == 0:
		Globals.WhichDialogue += 1
		DialogueManager.show_dialogue_balloon(ExplanationDialogue, "start") 
		
	elif Globals.WhichDialogue == 1:
		Globals.WhichDialogue += 1
		DialogueManager.show_dialogue_balloon(SkeletonDialogue, "start")
	
	elif Globals.WhichDialogue == 2:
		Globals.WhichDialogue += 1
		DialogueManager.show_dialogue_balloon(PriestDialogue, "start")
		
	else:
		Globals.WhichDialogue += 1
		DialogueManager.show_dialogue_balloon(DemoEnd, "start")
