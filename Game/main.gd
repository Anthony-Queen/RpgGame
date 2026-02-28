extends Node2D
@onready var player = $Player

func _ready():
	player.combat_started.connect(Globals.show_battle)
