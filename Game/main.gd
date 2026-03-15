extends Node2D
@onready var player = $Player

func _ready():
	player.combat_started.connect(Globals.show_battle)
	
	for enemy in get_tree().get_nodes_in_group("enemy"):
		if enemy.data.is_dead:
			enemy.queue_free()
