extends Resource
class_name Attributes

@export var max_hp: int = 40
@export var max_mana: int = 20
@export var strength: int = 5

var current_hp: int
var current_mana: int

func _init():
	current_hp = max_hp
	current_mana = max_mana
