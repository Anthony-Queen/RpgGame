extends Node2D

@onready var player = $Player
@onready var battle = $CanvasLayer/Battle  # adjust path to your CanvasLayer

func _ready():
	battle.init(player)  # passes the Player to Battle safely
