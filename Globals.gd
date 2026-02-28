extends Node
var current_enemy
#Player Variables
enum PlayerState { Exploring, Combat }
var currentPlayerState = PlayerState.Exploring
var player: Node = null
# Player Stats
var current_hp: float
var current_mana: float
var max_hp: int = 40
var max_mana: int = 20
var strength: int = 1

#func _init():
#	current_hp = max_hp
#	current_mana = max_mana

func save_data():
	Globals.player = player

func show_battle(enemy):
	if currentPlayerState == PlayerState.Combat:
		Globals.current_enemy = enemy
		save_data()
		get_tree().change_scene_to_file("res://Game/BattleUI/battle.tscn")
		
		
		
		print(enemy)
		
	elif currentPlayerState == PlayerState.Exploring:
		get_tree().change_scene_to_file("res://Game/Main.tscn")
