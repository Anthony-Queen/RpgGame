extends Node

# Very IMPORTANT, chooses which dialogue to show after u kill the enemy
var WhichDialogue = 0

# Enemy Variavbles
var isEnemyDefending = false
var defeated_enemies = []
var current_enemy #THIS is the Enemy Resource with the stats 
var current_enemy_node #And THIS is the Enemy node, with the script and allat

# Player Variables
enum PlayerState { Exploring, Combat }
var currentPlayerState = PlayerState.Exploring
var player: Node = null
var isPlayerDefending = false
# Player Stats
var current_hp: float = max_hp
var current_mana: float
var max_hp: float = 50
var max_mana: float = 100
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

# Functions for spawning enemies (Since it's not modular, cause it's easier)
func spawn_goblin():
	var pre_enemy = preload("res://Game/Goblin1.tscn")
	var enemy = pre_enemy.instantiate()
	enemy.global_position = Vector2(-50, 200)
	add_child(enemy)

func spawn_skeleton():
	var pre_enemy = preload("res://Game/Enemies/Skeleton.tscn")
	var enemy = pre_enemy.instantiate()
	enemy.global_position = Vector2(-50, 200)
	add_child(enemy)

func spawn_priest():
	var pre_enemy = preload("res://Game/Enemies/Priest3.tscn")
	var enemy = pre_enemy.instantiate()
	enemy.global_position = Vector2(-50, 200)
	add_child(enemy)

"func shake(sprite):
	sprite.global_position += Vector2(50, 0)
	await get_tree().create_timer(0.2).timeout
	sprite.global_position -= Vector2(100, 0)
	await get_tree().create_timer(0.2).timeout
	sprite.global_position += Vector2(50, 0)
"
