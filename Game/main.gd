extends Node2D
@onready var player = $Player

func _ready():
	player.combat_started.connect(Globals.show_battle)
	if Globals.current_enemy_node:
		Globals.current_enemy_node.death.connect(removeEnemy)

func removeEnemy():
	remove_child($Goblin1)
