extends Node2D
@onready var player = $Player
func _ready():
	player.combat_started.connect(show_battle)

func show_battle(enemy):
	if player.currentState == player.State.Combat:
		get_tree().change_scene_to_file("res://Game/BattleUI/battle.tscn")
	elif player.currentState == player.State.Exploring:
		get_tree().change_scene_to_file("res://Game/Main.tscn")
