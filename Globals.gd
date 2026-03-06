extends Node
var current_enemy = null
var current_enemy_node = null
#Player Variables
enum PlayerState { Exploring, Combat }
var currentPlayerState = PlayerState.Exploring
var player: Node = null
# Player Stats
var current_hp: float
var current_mana: float
var max_hp: float = 40
var max_mana: float = 20
var damage: float = 10

#func _init():
#	current_hp = max_hp
#	current_mana = max_mana

func show_battle(enemy):
	if currentPlayerState == PlayerState.Combat:
		enemy = current_enemy
		get_tree().change_scene_to_file("res://Game/BattleUI/battle.tscn")
		
		
		
	elif currentPlayerState == PlayerState.Exploring:
		get_tree().change_scene_to_file("res://Game/Main.tscn")
