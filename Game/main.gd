extends Node2D
@onready var player = $Player

func _ready():
	player.combat_started.connect(show_battle)

func show_battle(enemy):
	if player.currentState == player.State.Combat:
		var battle_scene = preload("res://Game/BattleUI/battle.tscn").instantiate()
		battle_scene.enemy = enemy
		get_tree().root.add_child(battle_scene)
		
		print(enemy)
		
	elif player.currentState == player.State.Exploring:
		get_tree().change_scene_to_file("res://Game/Main.tscn")
