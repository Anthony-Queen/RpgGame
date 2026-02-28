extends Resource
class_name Attributes

@export var max_hp: int = 40
@export var max_mana: int = 20
@export var strength: int = 5

func _init():
	Globals.current_hp = max_hp
	Globals.current_mana = max_mana
