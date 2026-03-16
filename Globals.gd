extends Node

var defeated_enemies = []
var current_enemy #THIS is the Enemy Resource with the stats 
var current_enemy_node #And THIS is the Enemy node, with the script and allat
# Player Variables
enum PlayerState { Exploring, Combat }
var currentPlayerState = PlayerState.Exploring
var player: Node = null
# Player Stats
var current_hp: float = max_hp
var current_mana: float
var max_hp: float = 50
var max_mana: float = 20
var strength: float = 1
var speed: float = 1
var current_xp

func _init():
	current_hp = max_hp
	current_mana = max_mana

func show_battle(enemy):
	if currentPlayerState == PlayerState.Combat:
		current_enemy_node = enemy
		current_enemy = enemy.data
		get_tree().change_scene_to_file("res://Game/BattleUI/battle.tscn")
		
		
		
	elif currentPlayerState == PlayerState.Exploring:
		get_tree().change_scene_to_file("res://Game/Main.tscn")
