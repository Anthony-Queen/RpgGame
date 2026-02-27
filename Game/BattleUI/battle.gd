extends Control
var player
var enemy = Globals.current_enemy

func _ready():
	$AnimatedSprite2D.sprite_frames = enemy.Sprite
	$AnimatedSprite2D.play("default")

func attack():
	player.attributes.current_hp -= enemy.Damage
	$Panel/HP.update_bar(
		player.attributes.current_hp,
		player.attributes.max_hp
	)

func init(_player):
	player = _player
	player.combat_started.connect(on_combat_started)
	print(player.attributes.current_hp)
	attack()
	print(player.attributes.current_hp)

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
