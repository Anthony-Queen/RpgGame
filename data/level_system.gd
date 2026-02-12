extends Node

@onready var xp_bar = $UI/XpBar
@onready var level_text = $UI/LevelText

@export var attribute_data: Attributes
@export var class_data: ClassData
@export var level_table: LevelTable

@export var level: int = 1
@export var current_xp: int = 0
@export var skill_points: int = 0

signal leveled_up(new_level, levels_gained)
signal xp_changed(current_xp, xp_to_next)

func _ready():
	assert(attribute_data != null, "assign an Attributes resource")
	assert(class_data != null, "assign a ClassData resource")
	assert(level_table != null, "assign a LevelTable resource")
	
	leveled_up.connect(update_level_text)
	xp_changed.connect(xp_bar_update)

func update_level_text(new_level, _levels_gained):
	level_text.text = str(new_level)

func xp_bar_update(new_xp,xp_to_next):
	xp_bar.max_value = xp_to_next
	xp_bar.value = new_xp

func _check_level_up() -> void:
	var levels_gained := 0
	while current_xp >= level_table.xp_to_next(level) and level < level_table.max_level:
		var xp_required = level_table.xp_to_next(level)
		current_xp = xp_required
		level += 1
		levels_gained += 1
		var res = class_data.apply_level_up(attribute_data, 1)
		
		leveled_up.emit(level, 1)
	
	if levels_gained > 1:
		leveled_up.emit(level, levels_gained)
	xp_changed.emit(current_xp, level_table.xp_to_next(level))

func add_xp(amount:int) -> void:
	if amount <= 0:
		return
	
	current_xp += amount
	xp_changed.emit(current_xp, level_table.xp_to_next(level))
	_check_level_up()
