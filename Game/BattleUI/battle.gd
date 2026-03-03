extends Control
@onready var enemy = Globals.current_enemy

func _ready():
	updateHp()
	$AnimatedSprite2D.sprite_frames = enemy.Sprite
	$AnimatedSprite2D.play("default")
	enemy.enemy_attack.connect(_on_enemy_attack)

func _on_enemy_attack():
	print("enemy atatcked")
	attack()

func updateHp():
	Globals.current_hp -= 0.01 # Fixes a bug that makes HpBar go to 0 (Idek why this happens tbh, but doing this fixes it.)
	$Panel/HP.update_bar(
			Globals.current_hp,
			Globals.max_hp
		)

func attack():
	Globals.current_hp -= enemy.Damage
	updateHp()

func show_panel(name):
	for panel in $PanelContainer.get_children():
		panel.visible = false
	$PanelContainer.get_node(name).visible = true

func on_combat_started(enemy):
	print("Combat started")

func _on_attack_pressed() -> void:
	show_panel("AttackPanel")

func _on_guard_pressed() -> void:
	show_panel("GuardPanel")

func _on_item_pressed() -> void:
	show_panel("ItemPanel")

func _on_special_pressed() -> void:
	show_panel("SpecialPanel")
