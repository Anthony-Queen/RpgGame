extends Node2D
@onready var player = $Player
@onready var ExplanationDialogue = load("res://Dialogues/MainExplanation.dialogue")

func _ready():
	player.combat_started.connect(Globals.show_battle)
	DialogueManager.show_dialogue_balloon(ExplanationDialogue, "start") 
	
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if enemy.data.is_dead:
			enemy.queue_free()
