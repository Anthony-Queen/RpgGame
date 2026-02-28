extends Control
var enemy = Globals.current_enemy

func _ready():
	$AnimatedSprite2D.sprite_frames = enemy.Sprite
	$AnimatedSprite2D.play("default")

	enemy = Globals.current_enemy
	print(Globals.current_hp)
	attack()
	print(Globals.current_hp)

func attack():
	Globals.current_hp -= enemy.Damage
	$Panel/HP.update_bar(
		Globals.current_hp,
		Globals.max_hp
	)

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
