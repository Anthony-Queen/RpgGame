extends Resource
class_name Attributes

@export var max_hp: int = 40
@export var max_mana: int = 50
@export var strength: int = 0

@export var current_hp: int
@export var current_mana: int

func _init():
	var current_hp = max_hp
	var current_mana = max_mana
