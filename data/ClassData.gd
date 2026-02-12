extends Resource
class_name ClassData

enum PlayerClass {
	STRENGTH
}

@export var class_id: PlayerClass = PlayerClass.STRENGTH
@export var display_name: String = "Strength"

#@export var vitality_gain_per_level: int = 1
@export var strength_gain_per_level: int = 1
@export var gain_per_level: int = 3
@export var life_gain_per_level: int = 10
@export var mana_gain_per_level: int = 5

func _init():
	if class_id == PlayerClass.STRENGTH:
		strength_gain_per_level = gain_per_level

func apply_level_up(attribute_data: Attributes, levels:int = 1) -> Dictionary: 
	if not attribute_data or not attribute_data is Attributes:
		return {"success": false, "error": "Invalid attribute_data"}
	
	attribute_data.strength += strength_gain_per_level * levels
	attribute_data.max_hp += life_gain_per_level * levels
	attribute_data.max_mana += mana_gain_per_level * levels
	
	return {
		"success": true,
		"levels_applied": levels
	}
